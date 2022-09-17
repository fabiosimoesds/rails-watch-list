class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    movie = Movie.new(title: params[:title], overview: params[:overview] , poster_url: params[:poster], rating: params[:rating])
    if movie.save
      @bookmark = Bookmark.new(movie_id: movie.id)
      @bookmark.list = List.find(params[:list_id])
    end
    if @bookmark.save
      redirect_to list_path(params[:list_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
