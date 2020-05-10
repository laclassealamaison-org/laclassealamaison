module ApplicationHelper
  def home_path_for(user)
    return root_path unless user

    case user.role
    when 'responsible_parent'
      children_path
    when 'teacher'
      teachers_courses_path
    else
      root_path
    end
  end

  def set_back_link(title, url)
    content_for(:back_link) do
      link_to url do
        content_tag(:i, '', class: 'fas fa-arrow-left mx-2') + title
      end
    end
  end
end
