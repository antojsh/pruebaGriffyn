class AddRoleRefToArticle < ActiveRecord::Migration
  
  def change
    add_reference :articles, :role, index: true, foreign_key: true
  end
end
