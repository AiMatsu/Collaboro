class CUser < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    has_many :requests, dependent: :destroy
    has_many :proposals, through: :favorite_hearts
    has_many :favorite_hearts, dependent: :destroy
    has_many :chatrooms, dependent: :destroy

    validates :company   ,presence: true
    validates :name      ,presence: true
    validates :tell      ,presence: true ,numericality: { only_integer: true } ,length: {maximum: 11}
    validates :post_code ,presence: true ,numericality: { only_integer: true } ,length: {maximum: 7}
    validates :address   ,presence: true
    validates :industry  ,presence: true

    attachment :image

    acts_as_paranoid

end
