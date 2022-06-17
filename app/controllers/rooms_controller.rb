class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @rooms = @user.rooms.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @room = Room.new
    @user = current_user
  end
 
  def create
    @room = Room.new(params.require(:room).permit(:name, :address, :image, :price, :detail, :user_id))
      if @room.save
        flash[:notice] = "ルーム登録しました"
        redirect_to :rooms
      else
        @user = current_user
        render 'new'
      end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @owner = @room.user
  end

  def edit
    @room = Room.find(params[:id])
    @user = current_user
  end

  def update
    @user = current_user
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :address, :image, :price, :detail))
      flash[:notice] = "ルーム情報を更新しました"
      redirect_to :rooms
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ルームを削除しました"
    redirect_to :rooms
  end
  
end
