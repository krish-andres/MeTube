class CommentsController < ApplicationController
  before_action :set_video
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @comment = @video.comments.new    
  end

  def create
    @comment = @video.comments.new(comment_params)
    if @comment.save
      redirect_to @video, notice: "Comment Successfully Created!"
    else
      render :new
    end
  end

  def edit    
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      redirect_to @video, notice: "Comment Successfully Updated!"
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @video, alert: "Comment Successfully Deleted!"
  end

  private

  def set_video
    @video = Video.find(params[:video_id])
  end

  def set_comment
    @comment = @video.comments.find(params[:id])    
  end

  def comment_params
    params.require(:comment).permit(:subject, :body)
  end
end
