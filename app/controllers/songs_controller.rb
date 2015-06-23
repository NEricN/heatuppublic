class SongsController < ApplicationController
  def vote
    if params[:win] != "win1" && params[:win] != "win2"
      return redirect_to :controller => :songs, :action => :play, :genre => session[:genre]
    end

    winner,loser = params[:win] == "win1" ? [session[:song1],session[:song2]] : [session[:song2],session[:song1]]
    winner,loser = [Song.find(winner), Song.find(loser)]

    if current_user
      current_user.count += 1
      current_user.liked.push(winner)
      current_user.save!
    end

    #do mathy things
    dwin,dlos = elo_rating(winner.score,loser.score)
    winner.score += dwin
    loser.score += dlos

    winner.save!
    loser.save!

    session[:song1] = nil
    session[:song2] = nil

    return redirect_to :controller => :songs, :action => :play, :genre => session[:genre]
  end

  def upload
    if current_user
      song = Song.create(:name => params[:name], :is_downloadable => params[:is_downloadable],
                         :genre => params[:genre], :user => current_user, :website => params[:website].nil? ? "" : params[:website])
      song.optional_genre_1 = params[:optional_genre_1] if params[:optional_genre_1]
      song.optional_genre_2 = params[:optional_genre_2] if params[:optional_genre_2]
      #song.song_bite = params[:song]

      #if params[:is_downloadable]
      #  song.song_large = params[:song]
      #end

      #song.save!

      #now do sound processing

      #first, generate tempfile
      file = params[:song].read
      filename = params[:song].original_filename

      tmpfile = Tempfile.new([filename.gsub(File.extname(filename), ""), File.extname(filename)])
      tmpfile.binmode
      tmpfile.write(file)
      tmpfile.rewind

      seconds = params[:start_15_m]*60 + params[:start_15_s]
      trim_song(tmpfile.path, seconds, 15)

      song.song_bite = tmpfile
      song.save!

      tmpfile.delete

      if params[:is_downloadable]
        if params[:is_full_song]
          #song_large_url = song.song_bite.current_path
          song.song_large = params[:song]
        else
          tmpfile = Tempfile.new([filename, File.extname(filename)])
          tmpfile.binmode
          tmpfile.write(file)
          tmpfile.rewind

          seconds = params[:start_40_m]*60 + params[:start_40_s]
          trim_song(tmpfile.path, seconds, 40)

          song.song_large = tmpfile

          tmpfile.delete
        end
      end

      song.save!

      return redirect_to edit_user_registration_path
    end
  end

  def play
  	session[:genre] = params[:genre].downcase
  	@genre = session[:genre]
  	@songs = get_top_songs @genre

  	if current_user and current_user.count >= 9
  		@last_10 = get_last_ten current_user
  		current_user.count = 0
  		current_user.save!
  	else
  		@last_10 = []
  	end

    counts = Song.where(:genre=>@genre).count

    if counts > 1
	  	rn1 = rand(counts)
	  	rn2 = rand(counts)
	  	while rn1 == rn2
	  		rn2 = rand(counts)
	  	end

	  	@song1 = Song.where(:genre=>@genre).offset(rn1).first
	  	@song2 = Song.where(:genre=>@genre).offset(rn2).first

  		session[:song1] = @song1.id
  		session[:song2] = @song2.id

      render :play
  	end
  end

  def generate_temp_file path
    path.gsub(File.extname(path), "-t"+File.extname(path))
  end

  def trim_song song_url, start, len
    temp_url = generate_temp_file song_url
    %x{ffmpeg -f mp3 -ss #{start} -i #{song_url} -t #{len} -y #{temp_url}}
    %x{rm #{song_url}}
    %x{mv #{temp_url} #{song_url}}
  end

  def get_top_songs genre
  	Song.where(genre:genre).order(score: :desc).limit(10)
  end

  def get_last_ten user
  	user.liked.last(10)
  end

  #first score is always winner
  def elo_rating(score1,score2)
  	if score1 < 2100 or score2 < 2100
  		k = 32
  	elsif score1 < 2401 or score2 < 2401
  		k = 24
  	else
  		k = 16
  	end

  	d = score1 - score2
  	f = 400

  	winner = k*(1 - (1/(10**((-d/f)+1))))
  	loser = k*(-(1/(10**((d/f)+1))))

  	return [winner,loser]
  end
end
