require "pry"

class ProgressUpdatesController < ApplicationController 
  load_and_authorize_resource :project  
  load_and_authorize_resource :through => :project, :except => :create

  def show
    @update = ProgressUpdate.find(params[:id])
    @comment = Comment.new
  end

  def user_index
    @updates = ProgressUpdate.all.where(user_id: params[:id])
    render :index
  end

  def index
    @updates = ProgressUpdate.all.where(project_id: params[:project_id])
  end

  def new
    if current_user
      @project = Project.find(params[:project_id])
      @update = ProgressUpdate.new
    else
      redirect_to "/users/sign_in"
    end
  end

  def create
    # cancancan not active on this route - check validity manually
    project = Project.find(params[:project_id])
    update = ProgressUpdate.add_and_update_project(update_params, params[:word_format], project)
    update.user = current_user
    if update.save
      update.project.save
      redirect_to project_path(project)
    else
      redirect_to "/"
    end
  end

  def edit
    if current_user
      @project = Project.find(params[:project_id])
      @update = ProgressUpdate.find(params[:id])
    else
      redirect_to "/users/sign_in"
    end
  end

  def update
    progress_update = ProgressUpdate.find(params[:id])
    if progress_update.update(update_params)
      redirect_to project_progress_update_path(progress_update.project, progress_update)
    else
      redirect_to "/"
    end
  end

  def destroy
    ProgressUpdate.find(params[:id]).destroy
    redirect_to "/"
  end

  private

  def update_params
    params.require(:progress_update).permit(:content, :words, :hours)
  end

end
