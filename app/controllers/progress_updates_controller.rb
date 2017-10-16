require "pry"

class ProgressUpdatesController < ApplicationController
  def show
    @update = ProgressUpdate.find(params[:id])
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

  private

  def update_params
    params.require(:progress_update).permit(:content, :words, :hours)
  end

end
