class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :role_id
      t.integer :manager_id
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :gender, :limit => 10
      t.date :birthday
      t.string :designation, :limit => 50
      t.string :avtar
      t.boolean :active, :default => false
      t.datetime :last_logged_in
      t.boolean :soft_delete, :default => false
      t.timestamps
    end
    
    [:role_id, :manager_id, :name, :active].each do |field|
      add_index :members, field
    end
    
  end
end
