class CategoriesController < ApplicationController
  def index
    @categories = Category.all.includes(:articles)
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.includes(:votes)
  end
end
