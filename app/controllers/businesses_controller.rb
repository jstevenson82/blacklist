class BusinessesController < ApplicationController
  
  layout "business_listings"
  respond_to :html, :js
  
  # GET /businesses
  def index

    if params[:catid].nil?
    	@categories = Category.find(:all, :conditions => ["parent_cat_id=0"])
    	@businesses = Business.find(:all, :conditions => ["status=1"], :order => 'listinglevel DESC, name ASC')
    else
    	@category_count = Category.count(:all, :conditions => ["parent_cat_id=?", params[:catid]])
    	if @category_count > 0
    		@categories = Category.find(:all, :conditions => ["parent_cat_id=?", params[:catid]])
    		@businesses = Business.find(:all, :order => 'listinglevel DESC, name ASC', :conditions => ["status=1 and parent_cat_id=?", params[:catid]])
    	else
    		@categories = Category.find(:all, :conditions => ["child_cat_id=?", params[:catid]])
    		@businesses = Business.find(:all, :order => 'listinglevel DESC, name ASC', :conditions => ["status=1 and child_cat_id=?", params[:catid]])
    	end
    end 
    
    @coupons = Coupon.all
    @businesses = @businesses.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /businesses/1
  def show
    @business = Business.find(params[:id])
    @coupons = Coupon.find(:all, :conditions => ["b_id=?", @business.id])
    @comment = Comment.new(params[:comment])
    @comments = Comment.find(:all, :conditions => ["comment_type='business' and item_id=?", @business.id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def businesses_create_comment
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(request.referer, :notice => 'Comment has been successfully posted.') }
      else
        format.html { redirect_to(request.fullpath, :error => 'There was an error posting comment.') }
      end
    end
  end

end
