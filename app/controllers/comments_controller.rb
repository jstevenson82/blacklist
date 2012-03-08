class CommentsController < ApplicationController
  respond_to :html, :js

  def index
    @comments = Comment.all
  end
  
  def new
  	@comment = Comment.new
  	@item_id = params[:item_id]
  	@comment_type = params[:comment_type]
  	
  	respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@comment, :notice => 'comment was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  

end
