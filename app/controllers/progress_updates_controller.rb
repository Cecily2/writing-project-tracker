class ProgressUpdatesController < ApplicationController
  def show
    @update = ProgressUpdate.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @update = ProgressUpdate.new
  end
end
