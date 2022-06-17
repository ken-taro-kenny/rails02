class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @reservations = @user.reservations.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @user = current_user
    @room = Room.find(params[:format])
    @reservation = Reservation.new
  end
  
  def confirm
    @user = current_user
    @reservation = Reservation.new(params.require(:reservation).permit(:name, :start_date, :end_date, :people, :price, :user_id, :room_id))
    if @reservation.valid?
      @date = (@reservation.end_date-@reservation.start_date).to_i
      @price = @reservation.price*@reservation.people*@date
    else
      flash[:notice] = "入力内容に誤りがあります"
      redirect_to new_reservation_path(@reservation.room_id)
    end
  end
  
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:name, :start_date, :end_date, :people, :price, :user_id, :room_id))
      @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to :reservations
  end
  
  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約をキャンセルしました"
    redirect_to :reservations
  end
  
end
