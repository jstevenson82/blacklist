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
  # GET /blogs/1.xml
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

  # GET /blogs/new
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  def create
    @blog = Blog.new(params[:blog])

    respond_to do |format|
      if @blog.save
        format.html { redirect_to(@blog, :notice => 'Blog was successfully created.') }
      else
        format.html { render :action => "blogs_new" }
        flash[:error] = 'There was an error adding blog.'
      end
    end
  end

  # PUT /blogs/1.xml
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to(@blog, :notice => 'Blog was successfully updated.') }
      else
        format.html { render :action => "blogs_edit" }
        flash[:error] = 'There was an error updating blog.'
      end
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(blogs_url) }
    end
  end

end
