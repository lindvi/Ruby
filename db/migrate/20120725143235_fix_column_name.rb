class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :Roqs, :next, :next_id
  end

  def down
  end
end
