require 'pry'
class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    if !params[:genre].blank?
      @projects = Project.joins(:project_genres).where(:project_genres => {:genre_id => params[:genre]})
    else
      @projects = Project.all
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.genres.build
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      flash[:success] = "Project created!"
      redirect_to project_path(@project)
    else
      flash.now[:error] = @project.full_errors_string
      render :"projects/new"
    end
  end

  def edit
    @project = Project.find(params[:id])
    @project.genres.build
  end  

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "Project updated!"      
      redirect_to project_path(@project)
    else
      flash.now[:error] = @project.full_errors_string      
      render :"projects/edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = "Project deleted."
    redirect_to user_path(@project.user)
  end




  private

  def project_params
    params.require(:project).permit(:title, :description, :word_goal, :words, :hours, :genre_ids => [], :genres_attributes => [:name])
  end


end
