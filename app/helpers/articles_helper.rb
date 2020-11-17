module ArticlesHelper
  def article_form
    render 'articles/form' if logged_in?
  end
end
