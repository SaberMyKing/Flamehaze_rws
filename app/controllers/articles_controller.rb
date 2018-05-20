class ArticlesController < ActionController::Base

  def create
  end

  def show
    @article = Article.find_by! id: params['id'], enabled: true
  end

end