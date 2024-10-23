class Reseller < ApplicationRecord
	# has_and_belongs_to_many :manufacturers # many to many relationship between resller and manufacturer
	has_many :distributions
	has_many :manufacturers, through: :distributions
end
