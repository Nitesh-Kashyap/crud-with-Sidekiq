class ProjectsController < ApplicationController
  before_action :current_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
   @project = Project.new(project_params)
    if @project.save
      #WelcomeJob.perform_now(@project)
      # Enqueue a job to be performed 2 minutes from now.
      WelcomeJob.set(wait: 2.minutes).perform_later(@project)
      redirect_to project_path(@project.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    authorize @project
    @project.update(project_params)
    redirect_to projects_path
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def current_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
