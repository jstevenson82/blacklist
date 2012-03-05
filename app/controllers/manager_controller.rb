class ManagerController < ApplicationController

	layout "manager"
	respond_to :html, :js

  # GET /categories
  def categories_index
    @categories = Category.all
    @categories = @categories.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html 
    end
  end

  # GET /categories/new
  def categories_new
    @category = Category.new
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /categories/1/edit
  def categories_edit
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  # POST /categories
  def categories_create
    @category = Category.new(params[:category])
    @categories = Category.all

    respond_to do |format|
      if @category.save
        format.html { redirect_to(categories_manager_path, :notice => 'Category was successfully created.') }
      else
        format.html { render :action => "categories_new" }
        flash[:error] = 'There was an error adding category.'
      end
    end
  end

  # PUT /categories/1
  def categories_update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(manager_edit_categories_path(@category), :notice => 'Category was successfully updated.') }
      else
        format.html { render :action => "categories_edit" }
        flash[:error] = 'There was an error updating category.'
      end
    end
  end

  # DELETE /categories/1
  def categories_destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_manager_url, :notice => 'Category was successfully deleted.') }
    end
  end

  # GET /coupons
  def coupons_index
  	@business = Business.find(params[:b_id])
    @coupons = Coupon.find(:all, :conditions => ["b_id=?", @business.id])
    @coupons = @coupons.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /coupons/1/new
  def coupons_new
  	@business = Business.find(params[:id])
    @coupon = Coupon.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /coupons/1/edit
  def coupons_edit
  	@coupon = Coupon.find(params[:id])
  	@business = Business.find(@coupon.b_id)    
  end

  # POST /coupons
  def coupons_create
    @coupon = Coupon.new(params[:coupon])

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to coupons_manager_path(@coupon.b_id), notice: 'Coupon was successfully created.' }
      else
        format.html { redirect_to(manager_new_coupons_url, :error => 'There was a problem creating coupon.') }
      end
    end
  end

  # PUT /coupons/1
  def coupons_update
    @coupon = Coupon.find(params[:id])
    @business = Business.find(@coupon.b_id) 

    respond_to do |format|
      if @coupon.update_attributes(params[:coupon])
        format.html { redirect_to manager_edit_coupons_path(@coupon), :notice => 'Coupon was successfully updated.' }
      else
        format.html { render action: "coupon_edit", :error => 'There was a problem updating the coupon.' }
      end
    end
  end

  # DELETE /coupons/1
  def coupons_destroy
    @coupon = Coupon.find(params[:id])
    @business = Business.find(@coupon.b_id) 
    @coupon.destroy

    respond_to do |format|
      format.html { redirect_to(coupons_manager_path(@business.id), :notice => 'Coupon has been deleted.') }
    end
  end

  # GET /products
  def products_index
  	@business = Business.find(params[:b_id])
    @products = Product.find(:all, :conditions => ["b_id=?", @business.id])
    @products = @products.paginate(:page => params[:page], :per_page => 10)    

    respond_to do |format|
      format.html 
    end
  end

  # GET /products/new
  def products_new
  	@business = Business.find(params[:b_id])
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /products/1/edit
  def products_edit
    @product = Product.find(params[:id])
    @business = Business.find(@product.b_id)
  end

  # POST /products
  def products_create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to(products_manager_path(@product.b_id), :notice => 'Product was successfully added.') }
      else
        format.html { render :action => "products_new" }
        flash[:error] = 'There was an error adding product.'
      end
    end
  end

  # PUT /products/1
  def products_update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(manager_edit_products_path(@product), :notice => 'Product was successfully updated.') }
      else
        format.html { render :action => "products_edit" }
        flash[:error] = 'There was an error updating product.'
      end
    end
  end

  # DELETE /products/1
  def products_destroy
    @product = Product.find(params[:id])
    @business = Business.find(@product.b_id)
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_manager_path(@business.id), :notice => 'Product was successfully deleted.') }
    end
  end

  # GET /services
  def services_index
  	@business = Business.find(params[:b_id])
    @services = Service.find(:all, :conditions => ["b_id=?", @business.id])
    @services = @services.paginate(:page => params[:page], :per_page => 10)  

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /services/1/new
  def services_new
  	@business = Business.find(params[:b_id])
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /services/1/edit
  def services_edit
  	@service = Service.find(params[:id])
  	@business = Business.find(@service.b_id)    
  end

  # POST /services
  def services_create
    @service = Service.new(params[:service])

    respond_to do |format|
      if @service.save
        format.html { redirect_to services_manager_path(@service.b_id), notice: 'Service was successfully added.' }
      else
        format.html { redirect_to(manager_new_services_url, :error => 'There was a problem creating service.') }
      end
    end
  end

  # PUT /services/1
  def services_update
    @service = Service.find(params[:id])
    @business = Business.find(@service.b_id)

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to manager_edit_services_path(@service), :notice => 'Service was successfully updated.' }
      else
        format.html { render action: "services_edit", :error => 'There was a problem updating the service.' }
      end
    end
  end

  # DELETE /services/1
  def services_destroy
    @service = Service.find(params[:id])
    @business = Business.find(@service.b_id)
    @service.destroy

    respond_to do |format|
      format.html { redirect_to(services_manager_path(@business.id), :notice => 'Service has been deleted.') }
    end
  end

  # GET /article
  def article_index
    @articles = Article.all
    @articles = @articles.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html 
    end
  end

  # GET /articles/new
  def article_new
    @article = Article.new

    respond_to do |format|
      format.html
    end
  end

  # GET /articles/1/edit
  def article_edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  def article_create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(articles_manager_path, :notice => 'Article was successfully created.') }
      else
        format.html { render :action => "article_new" }
        flash[:error] = 'There was an error adding article.'
      end
    end
  end

  # PUT /articles/1
  def article_update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(manager_edit_articles_path(@article), :notice => 'Article was successfully updated.') }
      else
        format.html { render :action => "article_edit" }
        flash[:error] = 'There was an error updating article.'
      end
    end
  end

  # DELETE /articles/1
  def article_destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(businesses_manager_url, :notice => 'Business has been deleted.') }
    end
  end

  # GET /businesses
  def businesses_index
    @businesses = Business.all
    @businesses = @businesses.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html 
    end
  end

 # GET /businesses/new
  def businesses_new
    @business = Business.new
    @categories = Category.find(:all, :conditions => ["parent_cat_id=0"])

    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def business_sub_cats
  	@categories = Category.find(:all, :conditions => ["parent_cat_id=?", params[:id]])	
	render :layout => false 
  end

  # GET /businesses/1/edit
  def businesses_edit
    @business = Business.find(params[:id])
    @images = Image.find(:all, :conditions => ["b_id=?", @business.id])
    @categories = Category.all
  end

  # POST /businesses
  def businesses_create
    @business = Business.new(params[:business])

    respond_to do |format|
      if @business.save
        format.html { redirect_to(businesses_manager_path, :notice => 'Business was successfully created.') }
      else
        format.html { render :action => "businesses_new" }
        flash[:error] = 'There was an error adding business.'
      end
    end
  end

  # PUT /businesses/1
  def businesses_update
    @business = Business.find(params[:id])
    @images = Image.find(:all, :conditions => ["b_id=?", @business.id])
    @categories = Category.all

    respond_to do |format|
      if @business.update_attributes(params[:business])
        format.html { redirect_to(manager_edit_businesses_path(@business), :notice => 'Business was successfully updated.') }
      else
        format.html { render :action => "businesses_edit" }
        flash[:error] = 'There was an error updating business.'
      end
    end
  end

  # DELETE /businesses/1
  #def businesses_destroy
  #  @business = Business.find(params[:id])
  #  @business.destroy

  #  respond_to do |format|
  #    format.html { redirect_to(businesses_manager_url, :notice => 'Business has been deleted.') }
  #  end
  #end
  
  # GET /users
  def user_index
    @users = User.all
    @users = @users.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /users/new
  def user_new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /users/1/edit
  def user_edit
    @user = User.find(params[:id])
  end

  # POST /users
  def user_create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_manager_path, :notice => 'User was successfully created.') }
      else
        format.html { render :action => "user_new" }
        flash[:error] = 'There was an error creating user account.'
      end
    end
  end

  # PUT /users/1
  def user_update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(manager_edit_users_path(@user), :notice => 'User was successfully updated.') }
      else
        format.html { render :action => "user_edit" }
        flash[:error] = 'There was an error updating user.'
      end
    end
  end

  # DELETE /users/1
  def user_destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_manager_url, :error => 'User has been deleted.') }
    end
  end

  # GET /images
  def images_index
  	@business = Business.find(params[:b_id])
    @images = Image.find(:all, :conditions => ["b_id=?", @business.id])
    @images = @images.paginate(:page => params[:page], :per_page => 10)    

    respond_to do |format|
      format.html 
    end
  end

  # GET /images/1/new
  def images_new
  	@business = Business.find(params[:b_id])
    @image = Image.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /images/1/edit
  def images_edit
    @image = Image.find(params[:id])
    @business = Business.find(@image.b_id)
  end

  # POST /images
  def images_create
    @image = Image.new(params[:image])
    @business = Business.find(@image.b_id)

    respond_to do |format|
      if @image.save
        format.html { redirect_to(images_manager_path(@image.b_id), :notice => 'Image was successfully added.') }
      else
        format.html { render :action => "images_new" }
        flash[:error] = 'There was an error adding image.'
      end
    end
  end

  # PUT /images/1
  def images_update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to(manager_edit_images_path(@image), :notice => 'Image was successfully updated.') }
      else
        format.html { render :action => "images_edit" }
        flash[:error] = 'There was an error updating product.'
      end
    end
  end

  # DELETE /images/1
  def images_destroy
    @image = Image.find(params[:id])
    @business = Business.find(@image.b_id)
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(images_manager_path(@business.id), :notice => 'Image was successfully deleted.') }
    end
  end

end