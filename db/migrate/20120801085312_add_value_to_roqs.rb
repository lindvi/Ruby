class AddValueToRoqs < ActiveRecord::Migration
  def change
    add_column :roqs, :value, :integer
  end
end
