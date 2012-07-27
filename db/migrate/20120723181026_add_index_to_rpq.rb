class AddIndexToRpq < ActiveRecord::Migration
  def change
  	add_index :rpqs, [:project_id, :question_id], unique: true
  end
end
