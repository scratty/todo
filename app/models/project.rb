# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
  has_many :tasks, inverse_of: :project
  has_many :users, through: :tasks
  accepts_nested_attributes_for :tasks
  resourcify
end
