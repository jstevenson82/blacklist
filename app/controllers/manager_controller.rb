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
    @coupons = Coupon.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /coupons/1/new
  def coupons_new
    @coupon = Coupon.new
    @business_id = params[:id]

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /coupons/1/edit
  def coupons_edit
    @coupon = Coupon.find(params[:id])
  end

  # POST /coupons
  def coupons_create
    @coupon = Coupon.new(params[:coupon])

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to businesses_manager_url, notice: 'Coupon was successfully created.' }
      else
        format.html { redirect_to(manager_new_coupons_url, :error => 'There was a problem creating coupon.') }
      end
    end
  end

  # PUT /coupons/1
  def coupons_update
    @coupon = Coupon.find(params[:id])

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
    @coupon.destroy

    respond_to do |format|
      format.html { redirect_to(coupons_manager_url, :notice => 'Coupon has been deleted.') }
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
  def businesses_destroy
    @business = Business.find(params[:id])
    @business.destroy

    respond_to do |format|
      format.html { redirect_to(businesses_manager_url, :notice => 'Business has been deleted.') }
    end
  end
  
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

end