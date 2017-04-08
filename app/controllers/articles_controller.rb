class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :show
  before_action :check_author, only: [:edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article["user_id"] = current_user.id

  if @article.save
    redirect_to edit_article_path(@article.slug), notice: "記事が作成されました"
  else
    render :new
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
  if @article.update(article_params)
    redirect_to edit_article_path(@article.slug), notice: "記事が更新されました"
  else
    render :edit
  end
end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
  @article.destroy
  redirect_to articles_url, notice: "記事が削除されました"
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:user_id, :category_id, :title, :content, :slug, :published, :published_at)
    end

    def check_author
  return redirect_to root_path unless @article.user == current_user
end
end
