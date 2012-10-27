class Addnextmodel < ActiveRecord::Migration
  def up
  	add_column :questions, :next_model, :string
  end

  def down
  end
end
