class ArticlesController < ActionController::Base

  def create

  end

  def show
    @article = Article.find 10
  end

end