class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :'lists/show', status: :unprocessable_entity
    end
  end

  def delete
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
