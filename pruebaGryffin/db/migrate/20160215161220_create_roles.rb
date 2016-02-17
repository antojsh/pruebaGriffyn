class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :nombre
      t.string :permission
      t.timestamps null: false
    end
    Role.create :nombre => "Public"
    Role.create :nombre => "Private"
    Role.create :nombre => "Role 1"
    Role.create :nombre => "Role 2"
    Role.create :nombre => "Role 3"
    Role.create :nombre => "Role 4"
  end

   
  def self.down
    drop_table :user_roles
  end                 
end
