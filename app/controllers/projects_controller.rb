require 'pry'
class ProjectsController < ApplicationController
  load_and_authorize_resource
  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.genres.build
  end

  def create
    project = Project.new(project_params)
    project.type = Type.find(params[:project][:type])
    project.user = current_user
    if project.save
      redirect_to project_path(project)
    else
      redirect_to "/"
    end
  end

  def edit
    @project = Project.find(params[:id])
    @project.genres.build
  end  

  def update
    project = Project.find(params[:id])
    project.type = Type.find(params[:project][:type])
    if project.update(project_params)
      redirect_to project_path(project)
    else
      redirect_to "/"
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to "/"    
  end




  private

  def project_params
    params.require(:project).permit(:title, :description, :word_goal, :words, :hours, :genre_ids => [], :genres_attributes => [:name])
  end


end
