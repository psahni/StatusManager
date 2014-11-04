class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :domain_name
      t.string :email
      t.string :mobile
      t.string :website
      t.timestamps
    end
  end
end
