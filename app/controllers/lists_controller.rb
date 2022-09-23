class ListsController < ApplicationController
  def index
    @lists = policy_scope(List)
    @list = List.new
  end

  def show
    @list_find = List.find(params[:id])
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

  private

  def list_params
    params.require(:list).permit(:name, :image_url, :photo)
  end
end
