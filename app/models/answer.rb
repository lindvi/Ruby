class Answer < ActiveRecord::Base
  attr_accessible :answer, :question_id, :user_id, :remember_token, :answer_id
end
# == Schema Information
#
# Table name: answers
#
#  id             :integer         not null, primary key
#  user_id        :integer
#  question_id    :integer
#  answer_id      :integer
#  remember_token :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  answer         :string(255)
#

