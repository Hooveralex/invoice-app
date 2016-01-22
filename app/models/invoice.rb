class Invoice < ActiveRecord::Base
	has_many :items, dependent: :destroy
	has_many :expenses, dependent: :destroy
end
