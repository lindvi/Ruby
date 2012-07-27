class AddAnswerTypeToQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :answer_type, :string, default: ""
  end
end
