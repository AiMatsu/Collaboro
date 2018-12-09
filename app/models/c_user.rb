class CUser < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    has_many :requests, dependent: :destroy
    has_many :blogs, dependent: :destroy
    has_many :proposals, dependent: :destroy
    has_many :favorite_hearts, dependent: :destroy
    has_many :chatrooms, dependent: :destroy


    attachment :image

    acts_as_paranoid
end
