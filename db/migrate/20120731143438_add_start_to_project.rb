class AddStartToProject < ActiveRecord::Migration
  def change
  	add_column :projects, :start_question, :integer
  end
end
