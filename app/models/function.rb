# == Schema Information
#
# Table name: functions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  active      :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Function < ActiveRecord::Base
end
