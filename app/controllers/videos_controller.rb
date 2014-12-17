class VideosController < ApplicationController
  before_action :find_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all    
  end

  def show
  end

  def new
    @video = Video.new    
  end

  def create
    @video = Video.new(video_params)
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
end
