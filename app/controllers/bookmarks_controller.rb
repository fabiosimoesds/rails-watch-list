class BookmarksController < ApplicationController
  def create
    existent_movie = Movie.where(title: params[:title])[0]
    if existent_movie
      movie = existent_movie
    else
      movie = Movie.new(title: params[:title], overview: params[:overview], poster_url: params[:poster], rating: params[:rating])
    end
    if movie.save
      @bookmark = Bookmark.new(movie_id: movie.id)
      authorize @bookmark
      @bookmark.list = List.find(params[:list_id])
      if @bookmark.save
        redirect_to list_path(params[:list_id])
      else
        render :new, status: :unprocessable_entity # I NEED TO GIVE A FEEDBACK TO THE CUSTOMER alert
      end
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
