class ArticlesController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :delete]
  # Index action to render all posts
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
  # New action for creating post
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  # Create action saves the post into database
  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Artigo criado com sucesso!"
      redirect_to @article
    else
      flash[:alert] = "Erro ao criar artigo!"
      render 'new'
    end
  end
  # Update action updates the post with the new information
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Artigo editado com sucesso!"
      redirect_to @article
    else
      flash[:alert] = "Erro ao editar artigo!"
      render 'edit'
    end
  end
  # The destroy action removes the post permanently from the database
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
