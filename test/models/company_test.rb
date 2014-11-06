# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  domain_name :string(255)
#  email       :string(255)
#  mobile      :string(255)
#  website     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
