class CommentsController < ApplicationController
  def index
    @comment_topics = current_user.comment_topics
  end

  def new
    @comment = Comment.new
    @topic_id = params[:topic_id]
  end

  def create
    @comment = current_user.comments.new(comment_params)
   
    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :topic_id,:content)
  end

end