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

	# User.where.not('name like ?', "%jack%").order(:id).limit(3).offset(2)
	# skipping two elements

	# User.where.not('name like ?', "%jack%").sum(:age)

	# User.where.not('name like ?', "%jack%").pluck(:age)
	# give array of age 

	# User.where('name like ?', "%jack%").select(:name) # like id, age
	# for getting specific column, we also use multiple params

	# User.average(:id)

	# User.maximum(:age)

	# User.minimum(:age)

	# User.where(name: "jack").explain
	# for optimizing query

	# User.where(:age => 33).update_all(:age => 29)
	# update_all use queries like above with where method
	# return active record relation

	# user.update_attribute(:age, 19)
	# use only on single user or user object

	# user = User.find 19
	# user.delete
	# for deleting specific user

	# User.where(:id=>20).update_all(:age => 19, :city_id => 6)
	# updating multiple columns

	# in recent version we use update and will return true/false

	# user = User.new
	# user.save 
	# give true/false
	# but 
	# user.save! here ! (bang) 
	# give error means it will show validation error












	# ================== dynamic finders so below queries will be generated =================
	# User.find_by_name("Jack Sparrow")

	# User.find_by_name_and_age("Jack Sparrow", 33)
	# SELECT `users`.* FROM `users` WHERE `users`.`name`
	
	# 'Jack Sparrow' AND `users`.`age` = 33











	# ============================== associations =======================================

	# relationships

	# user --- comments => one to many
	# customer --- bank account => one to one
	# books --- authors => many to many





	# ORM --- Object relational mapping (Active record)
	# model and database table





	# association in rails

	# lot of auto generated methods
	# simple dynamic method for the developer associated objs
	# clear OOPs


	# one --- one relation between 2 rails model -> has_one
	# one --- many relation between 2 rails model -> has_many
	# many --- many relation between 2 rails model -> has_and_belongs_many
	# many --- many relation between 2 rails model -> has_many through:
	# 1 --- n model relations -> polymorphic associations

	

	# tables in db 
	# ========================
	# Manufacturers
	# Resellers
	# Products


	# Manufacturers --- Products
	# has_many (one to many)


	# Manufacturers --- Resellers
	# has_and_belongs_many (many to many)




	# yaris = toyota.products.build(name: "Yaris", price: 9000, model: "SE")
	# then yaris.save
	# important command --- build

	# lc = toyota.products.create(name: "Land Cruiser", price: 19000, model: "SUV")








	validates :first_name, presence: { message: "should be present" }, exclusion: {in: %W/admin manager/}, 
	format: { with: /\A[A-Z]/, message: "should start with capital letter"}
	validates :last_name, presence: true
	validates :age, presence: true, numericality: true, inclusion: {in:(18..61)}
	validates :city_id, presence: true





	# custom validation
	validate :check_name_uniqueness

	def check_name_uniqueness

		exist = User.find_by_name(first_name + " " + last_name).nil? ? false : true
		if exist
			self.errors.add(:name, "already exist in db!")
		end
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
