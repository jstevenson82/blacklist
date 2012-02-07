class BusinessesInCategoriesController < ApplicationController
  # GET /businesses_in_categories
  # GET /businesses_in_categories.json
  def index
    @businesses_in_categories = BusinessesInCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businesses_in_categories }
    end
  end

  # GET /businesses_in_categories/1
  # GET /businesses_in_categories/1.json
  def show
    @businesses_in_category = BusinessesInCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @businesses_in_category }
    end
  end

  # GET /businesses_in_categories/new
  # GET /businesses_in_categories/new.json
  def new
    @businesses_in_category = BusinessesInCategory.new
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @businesses_in_category }
    end
  end

  # GET /businesses_in_categories/1/edit
  def edit
    @businesses_in_category = BusinessesInCategory.find(params[:id])
  end

  # POST /businesses_in_categories
  # POST /businesses_in_categories.json
  def create
    @businesses_in_category = BusinessesInCategory.new(params[:businesses_in_category])
    
    
    businesses_in_category = []

    respond_to do |format|
      if @businesses_in_category.save
        format.html { redirect_to @businesses_in_category, notice: 'Businesses in category was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /businesses_in_categories/1
  # PUT /businesses_in_categories/1.json
  def update
    @businesses_in_category = BusinessesInCategory.find(params[:id])

    respond_to do |format|
      if @businesses_in_category.update_attributes(params[:businesses_in_category])
        format.html { redirect_to @businesses_in_category, notice: 'Businesses in category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @businesses_in_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses_in_categories/1
  # DELETE /businesses_in_categories/1.json
  def destroy
    @businesses_in_category = BusinessesInCategory.find(params[:id])
    @businesses_in_category.destroy

    respond_to do |format|
      format.html { redirect_to businesses_in_categories_url }
      format.json { head :no_content }
    end
  end
end
