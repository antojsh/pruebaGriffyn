class Category < ActiveRecord::Base
	has_many :has_categories
	has_many :articles, through: :has_categories
end
