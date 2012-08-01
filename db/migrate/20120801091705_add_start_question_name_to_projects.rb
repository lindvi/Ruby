class AddStartQuestionNameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :start_question_name, :string
  end
end
