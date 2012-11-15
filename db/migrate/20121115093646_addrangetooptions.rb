class Addrangetooptions < ActiveRecord::Migration
  def up
  	add_column :options, :min_range, :integer
  	add_column :options, :max_range, :integer
  end

  def down
  end
end
