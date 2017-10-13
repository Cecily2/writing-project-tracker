class ProgressUpdatesController < ApplicationController
  def show
    @update = ProgressUpdate.find(params[:id])
  end
end
