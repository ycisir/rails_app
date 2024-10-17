class User < ApplicationRecord
	attr_accessor :first_name, :last_name

	# CITIES = %W/Nagpur Mumbai Hyderabad Delhi Jammu Bangalore Chennai Pune/


	# see validation in docs 
	# validates_presence_of
	# validates_length_of
	# validates_size_of
	# validates_format_of
	# validates_confirmation_of
	# validates_acceptance_of
	# validates_uniqueness_of
	# validates_numericality_of
	# but above are depreciated in newer version so we use it like below ex



	validates :firstname, presence: true, exclusion: {in: %W/admin manager/}
	validates :last_name, presence: true
	validates :age, presence: true, numericality: true, inclusion: {in:(18..61)}

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
