class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :code
      t.text :description
      t.timestamps
    end
    
    [:name, :code].each do |field|
      add_index :teams, field
    end
    
  end
end
