require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
# == Schema Information
#
# Table name: questions
#
#  id                         :integer         not null, primary key
#  name                       :text(255)
#  content                    :text
#  created_at                 :datetime        not null
#  updated_at                 :datetime        not null
#  answer_type                :string(255)     default("")
#  audio_url                  :string(255)     default("")
#  picture_url                :string(255)     default("")
#  set_reminder               :boolean         default(FALSE)
#  next_model                 :text
#  schedule_next_model        :string(255)     default("")
#  schedule_next_model_offset :integer
#

