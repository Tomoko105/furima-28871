class UsersItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  # has_one : consumer
end
