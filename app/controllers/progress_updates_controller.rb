require "pry"

class ProgressUpdatesController < ApplicationController 
  load_and_authorize_resource :project  
  load_and_authorize_resource :through => :project, :except => [:create, :user_index]
  before_action :current_project, only: [:new, :create, :edit]
  before_action :current_update, only: [:show, :edit, :update, :destroy]
  

  def show
    @comment = Comment.new

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @update, include: ['project', 'comments', 'comments.user'] }
    end

  end

  def user_index
    @updates = ProgressUpdate.all.where(user_id: params[:id])
    render :index
  end

  def index
    @updates = ProgressUpdate.all.where(project_id: params[:project_id])
  end

  def new
    @update = ProgressUpdate.new
  end

  def create
    # cancancan not active on this route - check validity manually
    if @project.user_id == current_user.id
      @update = ProgressUpdate.add_and_update_project(update_params, params[:word_format], @project)
      @update.user = current_user
      if @update.save
        @update.project.save
        flash[:success] = "Progress update created!"
        redirect_to project_path(@project)
      else
        flash.now[:error] = @update.full_errors_string
        render :new
      end
    else
      flash[:error] = "You don't own that project."
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @update.update(update_params)
      flash[:success] = "Edits saved!"
      redirect_to project_progress_update_path(@update.project, @update)
    else
      flash.now[:error] = @update.full_errors_string
      render :edit
    end
  end

  def destroy
    @update.destroy
    flash[:success] = "Update deleted."
    redirect_to project_path(@update.project)
  end

  private

  def update_params
    params.require(:progress_update).permit(:content, :words, :hours)
  end

  def current_project
    @project = Project.find(params[:project_id])
  end

  def current_update
    @update = ProgressUpdate.find(params[:id])
  end

end
