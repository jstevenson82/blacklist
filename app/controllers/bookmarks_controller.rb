class BookmarksController < ApplicationController

  
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
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    @bookmarks = Bookmark.find(:all, :conditions => ["user_id=?", params[:user_id]])    

    respond_to do |format|
      format.js
    end
  end
end
