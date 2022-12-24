class Item < ApplicationRecord
 
  # 商品投稿の項目のバリデーション
  validates  :item_name,           presence: true
  validates  :description,         presence: true  
  validates  :category_id,         presence: true  
  validates  :status_id ,          presence: true  
  validates  :delivery_charge_id,  presence: true  
  validates  :prifecture_id,       presence: true  
  validates  :shipping_day_id,     presence: true  
  validates  :price,               numericality: { only_integer: true,greater_than: 300, less_than: 9_999_999 }, 
                                   format: { with: /\A[0-9]+\z/ }, presence: true  
  validates :image,                presence: true 
                                                  
  # プルダウンのバリデーション
  validates :category_id,         numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id,           numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id,  numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prifecture_id,       numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_day_id,     numericality: { other_than: 1 , message: "can't be blank"} 

  # テーブルとのアソシエーション
  has_one  :user_item
  belongs_to :user
  has_one_attached :image

  # アクティブハッシュを用いたアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prifecture
  belongs_to :shipping_day




end


