class Matter < ActiveRecord::Base
	has_many :items
	has_many :expenses

	validates :name, presence: true
end
