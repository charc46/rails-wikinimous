class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    flash[:notice] = "Article successfully created"
    redirect_to article_path(@article.id)
  end

  def edit
  end

  def update
    @article.update(article_params)
    flash[:notice] = "Article successfully updated"
    redirect_to articles_path
  end

  def destroy
    @article.delete
    flash[:alert] = "Article successfully deleted"
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
