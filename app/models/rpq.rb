class Rpq < ActiveRecord::Base
  attr_accessible :rpq_id,:project_id, :question_id
  belongs_to :question
  belongs_to :project
end
# == Schema Information
#
# Table name: rpqs
#
#  id          :integer         not null, primary key
#  project_id  :integer
#  question_id :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

