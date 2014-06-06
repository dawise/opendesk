class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy, :show]

  def index
    @projects = current_user.projects + current_user.memberships.map(&:project)
  end

  def show
    @posts = @project.posts.order(created_at: :desc).paginate(:page => params[:page], :per_page => 9)
  end

  def new
  end

  def create
    project = current_user.projects.build(project_params)

    if project.save
      redirect_to project
    else
      flash[:error] = project.errors.full_messages.join("\n")
      redirect_to projects_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
