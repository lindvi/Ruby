class Roq < ActiveRecord::Base
  attr_accessible :roq_id, :option_id, :question_id, :next_id, :value, :max_range, :min_range
  belongs_to :question
  belongs_to :option
  belongs_to :next, class_name: "Question"
end
# == Schema Information
#
# Table name: roqs
#
#  id          :integer         not null, primary key
#  question_id :integer
#  option_id   :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  next_id     :integer
#  value       :integer
#  min_range   :integer
#  max_range   :integer
#

