class Role < ActiveRecord::Base
	has_many :articles
end
