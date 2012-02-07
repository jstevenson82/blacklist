class HomeController < ApplicationController

  def index
	@user_session = UserSession.new
	@categories = Category.find(:all, :conditions => ["parent_cat_id=0"])
	@blogs = Blog.all
	@articles = Article.all
  end

end