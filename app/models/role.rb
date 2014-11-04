class Role < ActiveRecord::Base
  
  # Validations
  validates :name, :uniqueness => true, :presence => true

  # Associations
  has_many :members

  scope :super_admin, ->{ where(name: 'Super Admin').first rescue nil }

end
