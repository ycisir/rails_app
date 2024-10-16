class User < ApplicationRecord
	validates_numericality_of :age, greater_than: 15

	def gender_string
		gender == 'F' ? "Female" : "Male"
	end
end
