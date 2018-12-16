class FUser < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    has_many :blogs, dependent: :destroy
    has_many :proposals, dependent: :destroy
    has_many :favorite_stars, dependent: :destroy
    has_many :crops_calendars, dependent: :destroy
    has_many :chatrooms, dependent: :destroy

    attachment :image

    acts_as_paranoid
end
