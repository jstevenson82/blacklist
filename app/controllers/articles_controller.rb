class ArticlesController < ApplicationController
  # GET /articles
  def index
    @articles = Article.all
    @articles = @articles.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

end
