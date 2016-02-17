class Article < ActiveRecord::Base
	belongs_to :user 
	belongs_to :role
	validates :body, presence:true,length:{minimum:20}
	
	after_create:save_categories


	def categories=(value)
		@categories = value
	end

	private

	def save_categories
		@categories.each do |category_id|
			HasCategory.create(category_id:category_id,article_id:self.id)
		end
	end
end
