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
#  id           :integer         not null, primary key
#  name         :string(255)
#  content      :text
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  answer_type  :string(255)     default("")
#  audio_url    :string(255)     default("")
#  picture_url  :string(255)     default("")
#  set_reminder :boolean         default(FALSE)
#  next_model   :text
#

