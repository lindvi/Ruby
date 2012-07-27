class Option < ActiveRecord::Base
  attr_accessible :text

  has_many :rqps
  has_many :reverse_roqs, foreign_key: "question_id",
                                   class_name:  "Roq"
  has_many :questions, through: :reverse_roqs

end
# == Schema Information
#
# Table name: options
#
#  id         :integer         not null, primary key
#  text       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

