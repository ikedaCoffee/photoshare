class PhotosController < ApplicationController
  before_action :set_photo, only: [:edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    if params[:back]
      @photo = Photo.new(photo_params)
    else
      @photo = Photo.new
    end
  end

  def confirm
    @photo = Photo.new(photo_params)
    render :new if @photo.invalid?
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path, notice: "新しい写真を投稿しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @photo.update(photo_params)
    redirect_to photos_path, notice: "更新しました!"
  end

  def destroy
    @photo.destroy
    redirect_to photos_path, notice: "削除しました！"
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :content)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
