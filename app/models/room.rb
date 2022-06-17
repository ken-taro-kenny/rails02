class Room < ApplicationRecord
  #関連付け、ルーム削除時に予約も削除
  belongs_to :user
  has_many :reservations, dependent: :destroy
  
  #carrierwaveの設定
  mount_uploader :image, ImageUploader
  
  #バリデーション
  validates :name, presence: true
  validates :image, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :detail, presence: true
  validates :detail, length: { maximum: 100 }
  
end