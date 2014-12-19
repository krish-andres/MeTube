class CommentsController < ApplicationController
  before_action :require_signin, except: [:show, :index]
  before_action :set_polymorphic_variable
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def show
  end

  def new
    @comment = @poly_var.comments.new    
  end

  def create
    @comment = @poly_var.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @poly_var, notice: "Comment Successfully Created!"
    else
      render :new
    end
  end

  def edit    
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      redirect_to @poly_var, notice: "Comment Successfully Updated!"
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @poly_var, alert: "Comment Successfully Deleted!"
  end

  private

  def set_polymorphic_variable
    if params[:video_id]
      @poly_var = Video.find(params[:video_id])
    elsif params[:playlist_id]
      @poly_var = Playlist.find(params[:playlist_id])
    end
  end

  def set_comment
    @comment = @poly_var.comments.find(params[:id])    
  end

  def comment_params
    params.require(:comment).permit(:subject, :body)
  end

  def require_correct_user
    unless current_user?(@comment.user)
      redirect_to root_url, alert: "Unauthorized Access!"
    end
  end
end
