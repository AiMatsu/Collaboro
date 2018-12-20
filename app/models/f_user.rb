class FUser < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    has_many :blogs, dependent: :destroy
    has_many :proposals, dependent: :destroy
    has_many :requests, through: :favorite_stars
    has_many :favorite_stars, dependent: :destroy
    has_many :crops_calendars, dependent: :destroy
    has_many :chatrooms, dependent: :destroy

    validates :farm      ,presence: true
    validates :name      ,presence: true
    validates :tell      ,presence: true
    validates :post_code ,presence: true ,numericality: { only_integer: true } ,length: {maximum: 7}
    validates :address   ,presence: true

    attachment :image

    acts_as_paranoid
end
