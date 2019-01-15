class CropsCalendar < ApplicationRecord

	belongs_to :f_user

	validates :crops ,presence: true

end
