require 'pry'
class ProjectsController < ApplicationController
  load_and_authorize_resource except: [:reached_goal]
  before_action :current_project, only: [:destroy, :edit, :update, :show]

  def index
    @genres = Genre.all
    @projects = Project.by_genre(params[:genre]).sort_order(params[:sort])
  end

  def reached_goal
    @projects = Project.reached_goal
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to project_path(@project)
    else
      flash.now[:error] = @project.full_errors_string
      render :"projects/new"
    end
  end

  def edit
  end  

  def update
    if @project.update(project_params)
      flash[:success] = "Project updated!"      
      redirect_to project_path(@project)
    else
      flash.now[:error] = @project.full_errors_string      
      render :"projects/edit"
    end
  end

  def destroy
    @project.destroy
    flash[:success] = "Project deleted."
    redirect_to user_path(@project.user)
  end


  private

  def project_params
    params.require(:project).permit(:title, :description, :word_goal, :words, :hours, :genre_ids => [], :genres_attributes => [:name])
  end

  def current_project
    @project = Project.find(params[:id])
  end

end
