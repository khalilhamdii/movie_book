class ArticlesController < ApplicationController
  def index
  @articles = Article.all.ordered_by_most_recent
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    redirect_to login_path unless logged_in?
    @article = Article.new
  end

  def edit; end

  def create
    @article = current_user.created_articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to articles_path, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_path, notice: 'Article was successfully destroyed.' }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :image, :category_list)
  end
end
