class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :users_items
  belongs_to :user #,optional: true

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :pref
  belongs_to_active_hash :ship
  has_one_attached :image
  validates :name, :explation, :category, :status, :pref, :ship, presence: true
  validates :category_id, :status_id, :burden_id, :pref_id, :ship_id, numericality: { other_than: 1 } 
  
  validates :price, numericality: true, :numericality => { :greater_than_or_equal_to => 300 }, :numericality => { :less_than_or_equal_to => 9999999 }, presence: true, format: /\A[0-9]+\z/
  #validates :status_id, numericality: { other_than: 1 } 
  #validates :burden_id, numericality: { other_than: 1 } 
  #validates :pref_id, numericality: { other_than: 1 } 
  #validates :ship_id, numericality: { other_than: 1 } 
end
