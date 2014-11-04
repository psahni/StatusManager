# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  status_id     :integer
#  project_id    :integer
#  activity_type :string(255)
#  activity      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Task < ActiveRecord::Base
end
