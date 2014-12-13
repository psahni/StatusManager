class ChangeTrackableTypeInActivities < ActiveRecord::Migration
  def up
  	change_column :activities, :trackable_id, :string, :null => false
  end

  def down
  	change_column :activities, :trackable_id, :string
  end
end
