class HomeController < ApplicationController
  def index
    @categories = Category.all
    @articles = Article.limit(2)
    @item = Article.last
    @time = Time.new
  end
end
