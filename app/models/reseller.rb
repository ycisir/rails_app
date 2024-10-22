class Reseller < ApplicationRecord
	has_and_belongs_to_many :manufacturers # many to many relationship between resller and manufacturer
end
