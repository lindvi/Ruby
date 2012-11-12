class Addcontrollerstoproject < ActiveRecord::Migration
  def up
  	add_column :projects, :schedule_next_model, :boolean
  	add_column :projects, :schedule_next_model_name, :string
  	add_column :projects, :schedule_next_model_offset, :integer
  end

  def down
  end
end
