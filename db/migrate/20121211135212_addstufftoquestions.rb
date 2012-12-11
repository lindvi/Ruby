class Addstufftoquestions < ActiveRecord::Migration
  def up
  	add_column :questions, :min, :integer, default: 0
  	add_column :questions, :max, :integer, default: 0
  end

  def down
  end
end
