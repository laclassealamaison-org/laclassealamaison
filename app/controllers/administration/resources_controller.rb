class Administration::ResourcesController < ApplicationController
  include AdministrationUserConcern

  def index
    @resources = policy_scope(Resource)
    authorize Resource
  end

  def create
    @resource = policy_scope(Resource).create!(resource_params)
    authorize @resource
    redirect_to administration_resources_path
  end

  def edit
    @resource = policy_scope(Resource).find(params[:id])
    authorize @resource
  end

  def update
    @resource = policy_scope(Resource).find(params[:id])
    authorize @resource
    @resource.update!(resource_params)
    redirect_to administration_resources_path
  end

  def new
    @resource = policy_scope(Resource).build
    authorize @resource
  end

  private

  def resource_params
    params.require(:resource).permit(:url, :description, :name, :classroom_id)
  end
end
