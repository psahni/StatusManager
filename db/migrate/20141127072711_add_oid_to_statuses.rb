class AddOidToStatuses < ActiveRecord::Migration
  
  def up
  	add_column :statuses, :oid, :string
  end

  def down
  	remove_column :statuses, :oid
  end

end
