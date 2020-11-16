module ApplicationHelper
  def nav_buttons
    if logged_in?
      content_tag :div, class: 'dropdown-menu dropdown-menu-right dropdown-info' do
        content_tag(:a, current_user.name, href: users_path, class: 'dropdown-item') +
          content_tag(:a, 'Logout', href: logout_path, class: 'dropdown-item')
      end
    else
      content_tag :div, class: 'dropdown-menu dropdown-menu-right dropdown-info' do
        content_tag(:a, 'Signup', href: signup_path, class: 'dropdown-item') +
          content_tag(:a, 'Login', href: login_path, class: 'dropdown-item')
      end
    end
  end
end