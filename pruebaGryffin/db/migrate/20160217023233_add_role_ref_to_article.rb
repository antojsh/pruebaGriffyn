class AddRoleRefToArticle < ActiveRecord::Migration
  
  def change
    add_reference :articles, :role, index: true, foreign_key: true
    add_foreign_key :articles, :roles
  end
end
