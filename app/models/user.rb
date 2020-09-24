class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :users_items
  has_many :items

  validates :nickname, :birthday, presence: true
  validates :email, presence: true, uniqueness: true, format: /[a-z0-9-.]{1,254}@[a-z0-9.]{1,254}/
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true, format: { with: VALID_PASSWORD_REGEX }
  validates :firstname, :lastname, presence: true, format: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  validates :kana_firstname, :kana_lastname, presence: true, format: /\A[ァ-ヶー－]+\z/
end
