module ApplicationHelper
  def nav_buttons
    if logged_in?
      content_tag(:i,"",class: 'fas fa-user brown-text') + 
        content_tag(:div, (link_to "#{current_user.name}", users_path, class: " brown-text font-weight-bold ml-2 mr-4"), class: 'nav-item') +
          content_tag(:div,(link_to "LOGOUT", logout_path, class: " brown-text font-weight-bold mr-5"), class: 'nav-item')
    else
        content_tag(:div, (link_to "LOGIN", login_path, class: " brown-text font-weight-bold mx-4"), class: 'nav-item') +
          content_tag(:div, (link_to "SIGN UP", signup_path, class: " brown-text font-weight-bold mr-5"), class: 'nav-item')
    end
  end

  def new_article_btn
    if logged_in?
        content_tag(:button,"Write an article", onclick: "location.href = '../articles/new';", class: 'nav-item rounded-pill btn btn-amber z-depth-1 mr-4')
    end
  end
end