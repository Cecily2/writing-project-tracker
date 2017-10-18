require 'pry'
class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @projects = Project.all
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
    @project.type = Type.find(params[:project][:type])
    @project.user = current_user
    @project.genres.each {|g| g.users << current_user}
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
    @project.type = Type.find(params[:project][:type])
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
