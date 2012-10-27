class Addnextmodel < ActiveRecord::Migration
  def up
  	add_column :questions, :next_model, :text
  end

  def down
  end
end
