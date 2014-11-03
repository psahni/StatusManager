class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :member_id
      t.text :yesterday_plan
      t.text :today_plan
      t.text :tomorrow_plan
      t.timestamps
    end
  end
end
