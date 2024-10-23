class Manufacturer < ApplicationRecord
	has_many :products, dependent: :destroy # means if we delete manufacturer so it will alse delete its related products
	# for association we only use destroy delete not work 
	# means if you delete Manufacturer destroy will delete its child products but delete cant

	# has_and_belongs_to_many :resellers # many to many relationship between resller and manufacturer


	# ====== To achieve below relation we need "has_many through:" =====================
	# toyota sells 100 units of Camry to Reseller2 at price 20000 each to which location
	# toyota sells 100 units of Camry to Reseller4 at price 21000 each to which location
	has_many :distributions
	has_many :resellers, through: :distributions
end
