class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.text :permission

      t.timestamps null: false
    end
  end
end
