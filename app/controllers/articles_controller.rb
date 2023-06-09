# This is an ArticlesController
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
  end
  def create
    current_user.articles.create(article_params)
    @article = Article.new article_params
    #if @article.valid?
      @article.save
      redirect_to @article
    #else
      #render action: 'new'
    #end
  end
  def show
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find params[:id]
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :body, :current_user)
  end
end
