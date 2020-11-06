class Administration::ResourcesController < ApplicationController
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

  def resource_params
    params.require(:resource).permit(:name, :classroom_id, :url, :description)
  end
end
