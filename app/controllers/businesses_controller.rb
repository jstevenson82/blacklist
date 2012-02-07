class BusinessesController < ApplicationController
  
  layout "business_listings"
  
  # GET /businesses
  def index
    @businesses = Business.find(:all, :order => 'listinglevel DESC, name ASC')
    
    if params[:catid].nil?
    	@categories = Category.find(:all, :conditions => ["parent_cat_id=0"])
    else
    	@categories = Category.find(:all, :conditions => ["parent_cat_id=?", params[:catid]])
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

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
