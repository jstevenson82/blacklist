class CouponsController < ApplicationController
  
  # GET /coupons
  def index
    @coupons = Coupon.all
    @coupons = @coupons.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
