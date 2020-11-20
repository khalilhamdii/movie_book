module ApplicationHelper

  def notice_bar
    if notice
      content_tag(:div, notice, class: 'amber text-white text-center rounded-pill font-weight-bold p-2 m-2')
    end
  end

  def nav_buttons

    if logged_in?
      img = image_tag(current_user.avatar, alt: "avatar image", class: "rounded-circle z-depth-0 avatar-img d-none d-lg-block d-xl-none")
      content_tag(:div,(link_to img, current_user)) + 
        content_tag(:div, (link_to "#{current_user.name.upcase}", current_user, class: " brown-text font-weight-bold"), class: 'nav-link') +
        content_tag(:div, (link_to "SETTINGS", users_path, class: " brown-text font-weight-bold"), class: 'nav-link') +
          content_tag(:div,(link_to "LOGOUT", logout_path, class: " brown-text font-weight-bold"), class: 'nav-link')
    else
        content_tag(:div, (link_to "LOGIN", login_path, class: " brown-text font-weight-bold "), class: 'nav-link') +
          content_tag(:div, (link_to "SIGN UP", signup_path, class: " brown-text font-weight-bold"), class: 'nav-link')
    end
  end

  def new_article_btn
    if logged_in?
        content_tag(:button,"Write a summary", onclick: "location.href = '../articles/new';", class: 'nav-link rounded-pill btn btn-amber z-depth-1 mr-3')
    end
  end

  def new_comment
    if logged_in?
      render 'comments/comment'
    end
  end

  def vote_or_devote_btn(article)
    if logged_in?
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      down = content_tag(:i, "", class: "fas fa-arrow-circle-up fa-2x amber-text")
      link_to(down, article_vote_path(id: vote.id, article_id: article.id), method: :delete, class: "amber-text font-weight-bold")
      
    else
      up = content_tag(:i, "", class: "fas fa-arrow-circle-up fa-lg grey-text")
      link_to(up, article_votes_path(article_id: article.id), method: :post, class: "amber-text font-weight-bold")
      
    end
  end
  end

  def number_of_votes(article)
    if article.votes.count == 0
      content_tag(:span, "No votes", class: "mx-2 amber-text font-weight-bold")
    elsif article.votes.count == 1
        content_tag(:span, "#{article.votes.count} vote", class: "mx-2 amber-text font-weight-bold")
    else
      content_tag(:span, "#{article.votes.count} votes", class: "mx-2 amber-text font-weight-bold")
    end
  end

  def top_article(category)
    top = category.articles.last
    category.articles.each do |article|
      top = article if article.votes.count > top.votes.count
    end
    top
  end

  def featured_article
    featured = Article.last
    Article.all.each do |article|
      featured = article if article.votes.count > featured.votes.count
    end
    featured
  end
end


