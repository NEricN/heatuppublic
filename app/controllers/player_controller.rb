class PlayerController < ApplicationController
	def organizer
		@genre = params[:genre]
		case @genre
		when "Pop"
			pop
		when "Rock"
			rock
		when "Hip-Hop"
			hip_hop
		when "Classical"
			classical
		when nil
			restart
		end
	end

	def rock
		@songs = RockSong.all
		if RockSong.count > 1
			if params[:playerNow]
				if params[:win]=="win1"
					RockSong.find(params[:song1Id]).increment()
				elsif params[:win]=="win2"
					RockSong.find(params[:song2Id]).increment()
				end
			end
			@songsV = RockSong.all.sort_by{|t| t.votes*-1}
			@l=RockSong.all.length
			@r1=rand(0...@l)
			@r2=@r1
			while @r2==@r1 do
				@r2=rand(0...@l)
			end
			@song1 = @songs[@r1]
			@song2 = @songs[@r2]
			render "player"
			return
		end
		render "player_empty"
	end

	def hip_hop
		@songs = HipHopSong.all
		if HipHopSong.count > 1
			if params[:playerNow]
				if params[:win]=="win1"
					HipHopSong.find(params[:song1Id]).increment()
				elsif params[:win]=="win2"
					HipHopSong.find(params[:song2Id]).increment()
				end
			end
			@songsV = HipHopSong.all.sort_by{|t| t.votes*-1}
			@l=HipHopSong.all.length
			@r1=rand(0...@l)
			@r2=@r1
			while @r2==@r1 do
				@r2=rand(0...@l)
			end
			@song1 = @songs[@r1]
			@song2 = @songs[@r2]
			render "player"
			return
		end
		render "player_empty"
	end
	
	def pop
		@songs = PopSong.all
		if PopSong.count > 1
			if params[:playerNow]
				if params[:win]=="win1"
					PopSong.find(params[:song1Id]).increment()
				elsif params[:win]=="win2"
					PopSong.find(params[:song2Id]).increment()
				end
			end
			@songsV = PopSong.all.sort_by{|t| t.votes*-1}
			@l=PopSong.all.length
			@r1=rand(0...@l)
			@r2=@r1
			while @r2==@r1 do
				@r2=rand(0...@l)
			end
			@song1 = @songs[@r1]
			@song2 = @songs[@r2]
			render "player"
			return
		end
		render "player_empty"
	end
	
	def classical
		@songs = ClassicalSong.all
		if ClassicalSong.count > 1
			if params[:playerNow]
				if params[:win]=="win1"
					ClassicalSong.find(params[:song1Id]).increment()
				elsif params[:win]=="win2"
					ClassicalSong.find(params[:song2Id]).increment()
				end
			end
			@songsV = ClassicalSong.all.sort_by{|t| t.votes*-1}
			@l=ClassicalSong.all.length
			@r1=rand(0...@l)
			@r2=@r1
			while @r2==@r1 do
				@r2=rand(0...@l)
			end
			@song1 = @songs[@r1]
			@song2 = @songs[@r2]
			render "player"
			return
		end
		render "player_empty"
	end

	def restart
		redirect_to url_for(:controller => :pages, :action => :home)
	end
end
