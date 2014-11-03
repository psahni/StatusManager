class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :status_id
      t.integer :project_id
      t.string :activity_type
      t.string :activity
      t.timestamps
    end
  end
end
