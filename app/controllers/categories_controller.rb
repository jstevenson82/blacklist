class CategoriesController < ApplicationController
 
  # GET /categories
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
