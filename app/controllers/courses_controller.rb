class CoursesController < ApplicationController
  before_action :authenticate_user!
  layout 'page'

  def index
    @q = Course.where(published: true).ransack(params[:q])
    @courses = @q.result(distinct: true)
  end

  def show
    @course = Course.where(published: true).find(params[:id])
    @children = current_user.children.where(classroom: @course.classroom) if current_user
  end
end
