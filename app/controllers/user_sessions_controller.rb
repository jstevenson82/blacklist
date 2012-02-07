class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @user_session }
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to(homepage_url, :notice => 'User session was successfully created.') }
      else
        format.html { redirect_to(homepage_url, :error => 'Problem logging in.') }
      end
    end
  end

  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to(homepage_url, :notice => 'You have been successfully logged out.') }
    end
  end
end
