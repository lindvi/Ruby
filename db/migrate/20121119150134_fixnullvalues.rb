class Fixnullvalues < ActiveRecord::Migration
  def up
  	change_column :roqs, :min_range, :string, default: ""
  	change_column :roqs, :max_range, :string, default: ""
  	change_column :questions, :schedule_next_model_offset, :string, default: ""
  end

  def down
  end
end
