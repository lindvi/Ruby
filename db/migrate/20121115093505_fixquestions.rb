class Fixquestions < ActiveRecord::Migration
  def up
  	add_column :questions, :schedule_next_model, :string, default: ""
  	add_column :questions, :schedule_next_model_offset, :integer
  end

  def down
  end
end
