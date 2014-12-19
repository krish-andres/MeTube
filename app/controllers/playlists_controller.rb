class PlaylistsController < ApplicationController
  before_action :require_signin
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    # @playlists = Playlist.all.order("name ASC") 
    @playlists = current_user.playlists.order("name ASC")
  end

  def show 
    @videos = @playlist.videos
    @comments = @playlist.comments.order("created_at DESC")
  end

  def new
    @playlist = Playlist.new    
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    if @playlist.save
      redirect_to @playlist, notice: "Playlist Successfully Created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @playlist.update(playlist_params)
    if @playlist.save
      redirect_to @playlist, notice: "Playlist Successfully Updated!"
    else
      render :edit
    end
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_url, alert: "Playlist Successfully Deleted!"
  end

  private 

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, video_ids: [])  
  end

  def require_correct_user
    unless current_user?(@playlist.user)
      redirect_to root_url, alert: "Unauthorized Access!"
    end
  end



end
