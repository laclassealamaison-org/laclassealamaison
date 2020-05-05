class Administration::ResourcesController < ApplicationController
  include AdministrationUserConcern

  def index
    @resources = policy_scope([:administration, Resource]).order(:name)
    authorize [:administration, Resource]
  end

  def create
    @resource = policy_scope([:administration, Resource]).create!(resource_params)
    authorize [:administration, Resource]
    redirect_to administration_resources_path
  end

  def edit
    @resource = policy_scope([:administration, Resource]).find(params[:id])
    authorize [:administration, Resource]
  end

  def update
    @resource = policy_scope([:administration, Resource]).find(params[:id])
    authorize [:administration, Resource]
    @resource.update!(resource_params)
    redirect_to administration_resources_path
  end

  def new
    @resource = policy_scope([:administration, Resource]).build
    authorize [:administration, Resource]
  end

  def destroy
    @resource = policy_scope([:administration, Resource]).find(params[:id])
    authorize [:administration, Resource]
    @resource.destroy
    redirect_to administration_resources_path
  end

  private

  def resource_params
    params.require(:resource).permit(:url, :description, :name, :classroom_id)
  end
end
