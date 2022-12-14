class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genre, only: [:edit, :update, :destroy]

  def index
    @genre = Genre.new
    @all_genre = Genre.all
    @genres = @all_genre.order(created_at: :desc).page(params[:page]).per(10)
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre .save
      redirect_to admin_genres_path
    else
      @genres = Genre.all.page(params[:page]).per(10)
      render :index
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  def destroy
    @genre.destroy
    redirect_to request.referer
  end

   private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end

end
