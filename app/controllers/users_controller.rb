class UsersController < ApplicationController

  layout "users"
  # GET /users/new
  def new
    @user = User.new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def show
    @user_id = current_user.id
    @user = User.find(@user_id)
    @comments = Comment.find(:all, :conditions => ["user_id=?", @user_id])
    @blogs = Blog.find(:all, :conditions => ["user_id=?", @user_id])
    @bookmarks = Bookmark.find(:all, :conditions => ["user_id=?", @user_id])
    
    respond_to do |format|
      format.html
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(edit_user_path(@user.id), :notice => 'User was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(edit_user_path(@user.id), :notice => 'User was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end  
  
  # GET /blogs/new
  def new_blogs
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /blogs/1/edit
  def edit_blogs
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  def create_blogs
    @blog = Blog.new(params[:blog])

    respond_to do |format|
      if @blog.save
        format.html { redirect_to(dashboard_path( current_user.id, :title => current_user.firstname + "-" + current_user.lastname ), :notice => 'Blog was successfully created.') }
      else
        format.html { render :action => "new_blogs" }
        flash[:error] = 'There was an error adding blog.'
      end
    end
  end

  # PUT /blogs/1.xml
  def update_blogs
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to(dashboard_path( current_user.id, :title => current_user.firstname + "-" + current_user.lastname ), :notice => 'Blog was successfully updated.') }
      else
        format.html { render :action => "edit_blogs" }
        flash[:error] = 'There was an error updating blog.'
      end
    end
  end
  

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(edit_user_path(@user.id)) }
    end
  end
  
  # DELETE /blogs/1
  def destroy_blogs
    @blog = Blog.find(params[:id])
    @blog.destroy
    @blogs = Blog.find(:all, :conditions => ["user_id=?", params[:user_id]])    

    respond_to do |format|
      format.js
    end
  end
  
  # DELETE /bookmarks/1
  def destroy_bookmarks
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    @bookmarks = Bookmark.find(:all, :conditions => ["user_id=?", params[:user_id]])    

    respond_to do |format|
      format.js
    end
  end
  
  # DELETE /comments/1
  def destroy_comments
    @comment = Comment.find(params[:id])
    @comment.destroy
    @comments = Comment.find(:all, :conditions => ["user_id=?", params[:user_id]])    

    respond_to do |format|
      format.js
    end
  end
end
