class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :current_update
  
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.progress_update = @update
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted!"
    redirect_to project_progress_update_path(@update.project, @update)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def current_update
    @update = ProgressUpdate.find(params[:progress_update_id])
  end
end
