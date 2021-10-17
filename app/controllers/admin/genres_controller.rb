class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    #else
      #flash[:genre_created_error] = "ジャンル名を入力してください"
    #redirect_to admin_genres_path
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end