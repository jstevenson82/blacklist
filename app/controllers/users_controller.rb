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

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(edit_user_path(@user.id)) }
    end
  end
end
