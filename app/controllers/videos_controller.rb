class VideosController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :find_video, only: [:show, :edit, :update, :destroy]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @videos = Video.all.order("title ASC")
  end

  def show
    @comments = @video.comments.order("created_at DESC")
  end

  def new
    @video = Video.new    
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    if @video.save
      redirect_to @video, notice: "Video Successfully Created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @video.update(video_params)
    if @video.save
      redirect_to @video, notice: "Video Successfully Updated!"
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to root_url, alert: "Video Successfully Deleted!"
  end

  private

  def find_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :youtube_url, :description)
  end

  def require_correct_user
    unless current_user?(@video.user)
      redirect_to root_url, alert: "Unauthorized Access!"
    end
  end
end
