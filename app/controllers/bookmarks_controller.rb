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


end
