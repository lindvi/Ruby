class AddRememberTokenToAnswer < ActiveRecord::Migration
  def change
  	add_column :answers, :remember_token, :string
  end
end
