class Takeawayunique < ActiveRecord::Migration
  def up
  	change_column :questions, :name, :text, :unique => false
  end

  def down
  end
end
