class AddStandupEmailToken < ActiveRecord::Migration
  def change
  	add_column :members, :standup_email_token, :string
  end
end
