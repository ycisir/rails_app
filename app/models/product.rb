class Product < ApplicationRecord
	belongs_to :manufacturer, optional: true
end
