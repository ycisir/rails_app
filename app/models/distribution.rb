class Distribution < ApplicationRecord
	belongs_to :product, optional: true
	belongs_to :manufacturer
	belongs_to :reseller
end
