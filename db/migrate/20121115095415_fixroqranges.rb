class Fixroqranges < ActiveRecord::Migration
  def up
  	add_column :roqs, :min_range, :integer
  	add_column :roqs, :max_range, :integer
  end

  def down
  end
end
