class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    progress_update = ProgressUpdate.find(params[:progress_update_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.progress_update = progress_update
    if comment.save
      flash[:success] = "Comment added!"
      redirect_to project_progress_update_path(progress_update.project, progress_update)
    else
      flash[:error] = "Couldn't create comment."
      redirect_to project_progress_update_path(progress_update.project, progress_update)
    end
  end

  def destroy
    progress_update = ProgressUpdate.find(params[:progress_update_id])
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted!"
    redirect_to project_progress_update_path(progress_update.project, progress_update)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
