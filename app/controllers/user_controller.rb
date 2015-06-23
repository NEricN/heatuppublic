class UserController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def songs
  	@songs = current_user.liked #array of songs

  	render :songs
  end
end
