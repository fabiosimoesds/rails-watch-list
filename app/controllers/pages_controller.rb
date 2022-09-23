class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @list = List.new
  end
end
