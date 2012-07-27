class AddDefaultToUser < ActiveRecord::Migration
  def change
  	change_column :Users, :admin, :boolean, default: false
  end
end
