class ConsumerUserItem
  include ActiveModel::Model
  attr_accessor :postalcode, :pref_id, :city, :address, :buldname, :tel, :token, :item_id, :user_id

  with_options presence: true do
    validates :postalcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :pref_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :tel, format: { with: /\A\d{11}\z/, message: 'only 11 digits can be entered' }
    validates :city, :address
    validates :token
  end

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Consumer.create!(postalcode: postalcode, pref_id: pref_id, city: city, address: address, buldname: buldname, tel: tel, user_item_id: user_item.id)
  end
end

#  message:"only 7 digits can be entered"
