class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :alarm_minutes
      t.string :alarm_hours
      t.integer :team_id
      t.string :timezone

      t.timestamps
    end
  end
end
