class User < ApplicationRecord
  #関連付け、アカウント削除時に登録ルーム、予約を削除
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  #--------------------------------------------------

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #carrierwaveの設定
  mount_uploader :image, ImageUploader
  
end
