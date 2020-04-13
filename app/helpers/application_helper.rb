module ApplicationHelper
  def home_path_for(user)
    return root_path unless user
    case user.role
    when "responsible_parent"
      children_path
    when "teacher"
      teachers_courses_path
    else
      root_path
    end
  end
end
