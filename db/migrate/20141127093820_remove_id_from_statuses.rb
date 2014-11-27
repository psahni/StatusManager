class RemoveIdFromStatuses < ActiveRecord::Migration
  def change
  	remove_column :statuses, :id, :integer
  end
end
