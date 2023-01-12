class UsersItem < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :pay
end
