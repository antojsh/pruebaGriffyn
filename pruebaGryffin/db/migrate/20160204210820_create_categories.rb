class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.string :color

      t.timestamps null: false
    end
    Category.create :name => "Category 1"
    Category.create :name => "Category 2"
    Category.create :name => "Category 3"
    Category.create :name => "Category 4"
   
  end

  
end
