class AddIndexToRpq < ActiveRecord::Migration
  def change
	create_table :rpqs do |t|
      t.integer :project_id
      t.integer :question_id

      t.timestamps
    end
  	add_index :rpqs, [:project_id, :question_id], unique: true
  end
end
