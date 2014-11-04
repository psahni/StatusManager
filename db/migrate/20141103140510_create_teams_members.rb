class CreateTeamsMembers < ActiveRecord::Migration
  def change
    create_table :teams_members do |t|
      t.integer :member_id
      t.integer :team_id
      t.timestamps
    end
    
    add_index(:teams_members, [:team_id, :member_id], :unique => true)
    
  end
end
