class Reservation < ApplicationRecord
  
  #関連付け
  belongs_to :user
  belongs_to :room
  
  #バリデーション
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :people, presence: true
  validates :people, numericality: true
  
  # 開始日、終了日逆転防止
  validate :start_end_check
  
  def start_end_check
    return if start_date.nil? || end_date.nil?
    errors.add(:end_date, "は開始日より前の日付は登録できません。") if start_date > end_date
  end
 #------------------------
 
end
