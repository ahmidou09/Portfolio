class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show update destroy]
  before_action :authorize_public_access, only: %i[index show]
  before_action :authorize_admin_access, only: %i[create update destroy]

  # GET /projects
  def index
    @projects = Project.all
    render json: @projects
  end

  # GET /projects/1
  def show
    render json: @project
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    render json: { message: 'Project was successfully destroyed.' }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:title, :description, :details, :poster_img, :github_link, :live_link,
                                    technologies: [], features: [], images: [])
  end

  def authorize_public_access
    # Allow public access for GET requests
    # No authentication required for GET requests
  end

  def authorize_admin_access
    # Check if the current user is present (authenticated)
    return if @current_user.present? && @current_user.admin?

    render json: { error: 'Authentication and admin access required' }, status: :unauthorized
  end
end

