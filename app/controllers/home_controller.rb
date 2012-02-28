class HomeController < ApplicationController

  def home
	@user_session = UserSession.new
	@categories = Category.find(:all, :conditions => ["parent_cat_id=0"])
	@blogs = Blog.all
	@articles = Article.all
	@businesses = Business.find(:all, :conditions => ["status=1 and listinglevel=120"], :limit => 4)
  end
  
  def advertise
    respond_to do |format|
      format.html { render :layout => "advertise" }
    end   
  end

end