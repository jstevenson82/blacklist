class BookmarksController < ApplicationController

  # GET /bookmarks/1
  def list_bookmarks
    @bookmark = Bookmark.find(:all,params[:id])

    respond_to do |format|
      format.html
    end
  end

  # GET /bookmarks/new
  def bookmarks_new
    @bookmark = Bookmark.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bookmark }
    end
  end

  # create /bookmarks
  def create
    @bookmark = Bookmark.new(params[:bookmark])
    @bookmarked = false

	respond_to do |format|
		
	  if !Bookmark.exists?( :b_id => @bookmark.b_id, :user_id => current_user.id )
	  	@bookmark.save
	  	bookmarked = true
	  	format.js
	  else
	  	bookmarked = false
	  	format.js
	  end
    end
  end

  # DELETE /bookmarks/1
  def bookmarks_destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    respond_to do |format|
      format.html { redirect_to(bookmarks_url) }
    end
  end
end
