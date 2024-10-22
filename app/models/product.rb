class Product < ApplicationRecord
	belongs_to :manufacturer, optional: true
	validates :model, presence: true
end
