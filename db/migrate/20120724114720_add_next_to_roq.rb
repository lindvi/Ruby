class AddNextToRoq < ActiveRecord::Migration
  def change
    add_column :roqs, :next, :integer
  end
end
