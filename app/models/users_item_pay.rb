class UsersItemPay
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prifecture_id, :city, :address, :building, :tel, :token

  with_options presence: true do
    validates :post_code,           format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "例）123-4567"}
    validates :user_id
    validates :item_id
    validates :city
    validates :address             
    validates :tel,                 format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid"}
    validates :token
  end

  validates :prifecture_id,       numericality: { other_than: 1 , message: "can't be blank"} 

  def save
    users_item = UsersItem.create(user_id: user_id, item_id: item_id)
    Pay.create(post_code: post_code, prifecture_id: prifecture_id, city: city, address: address, building: building, tel: tel, users_item_id: users_item.id)
  end

end