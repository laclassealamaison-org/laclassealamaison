class Administration::MenusController < ApplicationController
  def index
    authorize %i[administration menu], :index?
  end
end
