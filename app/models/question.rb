class Question < ActiveRecord::Base

  attr_accessible :content, :name

  validates :name, uniqueness: true

  has_many :rqps
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
#  id         :integer         not null, primary key
#  name       :string(255)
#  content    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

