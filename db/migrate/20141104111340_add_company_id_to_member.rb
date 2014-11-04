class AddCompanyIdToMember < ActiveRecord::Migration
  def change
    add_column :members, :company_id, :integer
  end
end
