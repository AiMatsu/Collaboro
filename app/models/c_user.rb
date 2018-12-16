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
    # has_many :messages, dependent: :destroy

    attachment :image

    acts_as_paranoid
end
