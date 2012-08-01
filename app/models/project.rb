class Project < ActiveRecord::Base
  attr_accessible :active, :name, :version, :start_question, :start_question_name
  has_many :rpqs
  has_many :questions, :through => :rpqs
end
# == Schema Information
#
# Table name: projects
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  version        :string(255)
#  active         :boolean         default(FALSE)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  start_question :integer
#

