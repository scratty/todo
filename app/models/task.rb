# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  project_id :integer
#  user_id    :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ApplicationRecord
  extend Enumerize
  belongs_to :project
  belongs_to :user
  resourcify
  enumerize :status, in: { pending: 0, in_progress: 1, done: 2, cancelled: 3 }, default: :pending
end
