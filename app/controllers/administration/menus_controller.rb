class Administration::MenusController < ApplicationController
  def index
    authorize [:administration, :menu], :index?
  end
end
