module ApplicationHelper
  def nav_buttons
    if logged_in?
      content_tag :div do
        content_tag(:button, current_user.name, onclick: "location.href = '../users';", class: 'btn btn-success mr-2') +
          content_tag(:button, 'Logout', onclick: "location.href = '../logout';", class: 'btn btn-success')
      end
    else
      content_tag :div do
        content_tag(:button, 'Sign Up', onclick: "location.href = '../signup';", class: 'btn btn-success mr-2') +
          content_tag(:button, 'Login', onclick: "location.href = '../login';", class: 'btn btn-success')
      end
    end
  end
end
