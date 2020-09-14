class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :users_items
  belongs_to :user # ,optional: true

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :pref
  belongs_to_active_hash :ship
  has_one_attached :image
  validates :name, :explation, :category, :status, :pref, :ship, :image, presence: true
  validates :category_id, :status_id, :burden_id, :pref_id, :ship_id, numericality: { other_than: 1 }

  validates :price, numericality: true, presence: true, format: /\A[0-9]+\z/
  validates_inclusion_of :price, in: 300..9_999_999
  # validates :status_id, numericality: { other_than: 1 }
  # validates :burden_id, numericality: { other_than: 1 }
  # validates :pref_id, numericality: { other_than: 1 }
  # validates :ship_id, numericality: { other_than: 1 }
end
