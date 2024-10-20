class User < ApplicationRecord
	attr_accessor :first_name, :last_name

	# CITIES = %W/Nagpur Mumbai Hyderabad Delhi Jammu Bangalore Chennai Pune/


	# ===================== see validation in docs =========================
	# validates_presence_of
	# validates_length_of
	# validates_size_of
	# validates_format_of
	# validates_confirmation_of
	# validates_acceptance_of
	# validates_uniqueness_of
	# validates_numericality_of
	# but above are depreciated in newer version so we use it like below ex



	validates :first_name, presence: { message: "should be present" }, exclusion: {in: %W/admin manager/}, 
	format: { with: /\A[A-Z]/, message: "should start with capital letter"}
	validates :last_name, presence: true
	validates :age, presence: true, numericality: true, inclusion: {in:(18..61)}
	validates :city_id, presence: true

	# custom validation
	validate :check_name_uniqueness


	# custom validation
	def check_name_uniqueness
		# ================= some useful methods ==============

		# return array
		# User.find 1,2 we can specify multiple arg here
		# User.first
		# User.first(5)
		# User.last(5)




		# ================ these are the active record queries ===============

		# return active record relation
		# we can specify multiple condition in where

		# User.where(age: 33) 

		# User.where(age: 18..61).count
		# SELECT COUNT(*) FROM `users` WHERE `users`.`age` BETWEEN 18 AND 61

		# User.where(age: 18..61, id: 20..30).count
		# SELECT COUNT(*) FROM `users` WHERE `users`.`age` BETWEEN 18 AND 61 AND `users`.`id` BETWEEN 20 AND 30

		# User.where.not(age: 33).count
		# SELECT `users`.* FROM `users` WHERE `users`.`age` != 33 

		# User.where('age > ?', 19).count
		# remeber to put ? and use '' = SELECT `users`.* FROM `users` WHERE (age > '19') to prevent SQL injection

		# User.where('age > ? and gender = ?', 19, 'M')
		# SELECT `users`.* FROM `users` WHERE (age > '19' and gender = 'M')

		# User.where('name like ?', "%Jack%")
		# SELECT `users`.* FROM `users` WHERE (name like '%Jack%')

		# ordey by name, id etc ascending descending
		# User.where('name like ?', "%Jack%").order('name DESC') for descending

		# User.where('name like ?', "%Jack%").order(:id)
		# SELECT `users`.* FROM `users` WHERE (name like '%Jack%') /* loading for pp */ ORDER BY `users`.`id`

		# User.where.not('name like ?', "%Jack%").order(:id).limit(3)
		# limiting the output



		# ================== dynamic finders so below queries will be generated =================
		# User.find_by_name("Jack Sparrow")

		# User.find_by_name_and_age("Jack Sparrow", 33)
		# SELECT `users`.* FROM `users` WHERE `users`.`name`
		
		# 'Jack Sparrow' AND `users`.`age` = 33

		exist = User.find_by_name(first_name + " " + last_name).nil? ? false : true
		self.errors.add(:name, "already exist in db!")
		# byebug
	end

	def gender_string
		gender == 'F' ? "Female" : "Male"
	end

	def fullname
		first_name + " " + last_name
	end

	def city_name
		city_id.nil? ? "No data" : City.find(city_id).name 
	end
end
