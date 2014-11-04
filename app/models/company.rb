class Company < ActiveRecord::Base
  
  # Validations
  validates :name, :presence => true, :uniqueness => true

  # Associations
  has_many :teams
  has_one :admin, class_name: "Member"

  attr_accessor :admin_email

  after_create :create_admin_of_company

  rails_admin do
    field :name
    field :admin_email do
      label 'Admin Email'
    end
  end

  def create_admin_of_company
    email = self.admin_email
    self.errors.add(:admin_email, "Admin Email can't be blank")
    Member.create!(:email => email, :role => Role.super_admin)
  end

end
