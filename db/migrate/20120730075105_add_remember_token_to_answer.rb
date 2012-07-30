class AddRememberTokenToAnswer < ActiveRecord::Migration
  def change
  	add_column :answers, :remember_token, :string
  	change_column :answers, :answer, :answer_id
  end
end
