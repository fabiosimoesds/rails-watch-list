class ListsController < ApplicationController
  def index
    @lists = policy_scope(List)
    @list = List.new

    respond_to do |format|
      format.html
      format.csv { send_data @lists.to_csv, filename: "list-#{Date.today}.csv" }
    end
  end

  def show
    @list_find = List.find(params[:id])
    @movies = @list_find.movies
    respond_to do |format|
      format.html
      format.csv { send_data @movies.to_csv, filename: "#{@list_find.name}-movies-#{Date.today}.csv" }
    end
    authorize @list_find
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    authorize @list
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:id])
    authorize @list
  end

  def update
    @list = List.find(params[:id])
    authorize @list
    @list.update(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    authorize @list
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name, :image_url, :photo)
  end
end
