class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @article_list = Article.all
  end
end
