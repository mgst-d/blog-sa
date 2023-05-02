# This is an ArticlesController
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
  end
end
