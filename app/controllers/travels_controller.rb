class TravelsController < ApplicationController
  
  def index
    if user_signed_in?
      @user = current_user
    end
  end
  
  def new
    if user_signed_in?
      @user = current_user
    end
    
    if params[:keyword].present?
      @rooms = Room.where('name LIKE ?', "%#{params[:keyword]}%").paginate(page: params[:page], per_page: 8).or Room.where('detail LIKE ?', "%#{params[:keyword]}%").paginate(page: params[:page], per_page: 8)
    elsif params[:area_word].present?
      @rooms = Room.where('address LIKE ?', "%#{params[:area_word]}%").paginate(page: params[:page], per_page: 8)
    else
      @rooms = Room.all.paginate(page: params[:page], per_page: 8)
    end
  end
end
