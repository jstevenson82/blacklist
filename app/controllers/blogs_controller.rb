class BlogsController < ApplicationController
  # GET /blogs
  def index
    @blogs = Blog.all
    @blogs = @blogs.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html 
    end
  end
  
  # GET /blogs/1
  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def blogs_create_comment
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(request.referer, :notice => 'Comment has been successfully posted.') }
      else
        format.html { redirect_to(request.referer, :error => 'There was an error posting comment.') }
      end
    end
  end

end
