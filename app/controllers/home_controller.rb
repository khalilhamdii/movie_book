class HomeController < ApplicationController
  def index
    @categories = Category.all
    @articles = Article.limit(2)
    @item = Article.last
  end
end
