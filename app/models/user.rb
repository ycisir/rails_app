class User < ApplicationRecord
	attr_accessor :first_name, :last_name

	# CITIES = %W/Nagpur Mumbai Hyderabad Delhi Jammu Bangalore Chennai Pune/

	validates_numericality_of :age, greater_than: 15

	def gender_string
		gender == 'F' ? "Female" : "Male"
	end

	def fullname
		first_name + " " + last_name
	end

	def firstname
		name.split(/\s/).first
	end

	def lastname
		name.split(/\s/).last
	end

	def city_name
		city_id.nil? ? "No data" : City.find(city_id).name 
	end
end
