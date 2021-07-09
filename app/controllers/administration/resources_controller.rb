class Administration::ResourcesController < ApplicationController
  include AdministrationUserConcern
  before_action :set_resource, only: [:destroy, :edit, :update]

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to administration_resources_path, notice: 'La ressource a été ajoutée.'
    else
      render :new
    end
  end

  def edit;  end

  def update
    if @resource.update(resource_params)
       redirect_to administration_resources_path
     else
       render :edit
     end
  end

  def destroy
    @resource.destroy
    redirect_to administration_resources_path
  end

  private

  def set_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:name, :classroom_id, :url, :description)
  end
end
