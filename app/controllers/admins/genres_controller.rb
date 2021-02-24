class Admins::GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :update]
  before_action :authenticate_admin!
  
  def index
    @genre = Genre.new
    @genres = Genre.all.page(params[:page]).per(5)
  end

  def edit
  end


  def create
  	@genre = Genre.new(genre_params)
    if @genre.save
       flash[:notice] = "ジャンルを追加しました"
       redirect_to admins_genres_path
    else
      @genres = Genre.all.page(params[:page]).per(5)
      render :index
    end
  end
  
  def update
    if @genre.update(genre_params)
      flash[:success] = "ジャンルを変更しました"
      redirect_to admins_genres_path
    else
      render :edit
    end
  end
  
  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end
end
