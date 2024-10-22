class Manufacturer < ApplicationRecord
	has_many :products, dependent: :destroy # means if we delete manufacturer so it will alse delete its related products
	# for association we only use destroy delete not work 
	# means if you delete Manufacturer destroy will delete its child products but delete cant

	has_and_belongs_to_many :resellers # many to many relationship between resller and manufacturer

end
