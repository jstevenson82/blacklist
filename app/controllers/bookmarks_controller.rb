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
  def bookmarks_create
    @bookmark = Bookmark.new(params[:bookmark])

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to(@bookmark, :notice => 'Bookmark was successfully created.') }
      else
        format.html { render :action => "new" }
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
