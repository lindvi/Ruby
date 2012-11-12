class Question < ActiveRecord::Base

  attr_accessible :id, :content, :name, :answer_type, :picture_url, :audio_url, :set_reminder, :next_model


  has_many :rqps, foreign_key: "question_id", class_name: "Rpq", dependent: :destroy
  has_many :reverse_rpqs, foreign_key: "question_id",
                                   class_name:  "Rpq"
  has_many :projects, through: :reverse_rpqs

  has_many :roqs
  has_many :options, :through => :roqs

  has_many :next_questions, through: :roqs, source: :next
end
# == Schema Information
#
# Table name: questions
#
#  id           :integer         not null, primary key
#  name         :text(255)
#  content      :text
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  answer_type  :string(255)     default("")
#  audio_url    :string(255)     default("")
#  picture_url  :string(255)     default("")
#  set_reminder :boolean         default(FALSE)
#  next_model   :text
#

