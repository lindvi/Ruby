class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :roqs, :next, :next_id
  end

  def down
  end
end
