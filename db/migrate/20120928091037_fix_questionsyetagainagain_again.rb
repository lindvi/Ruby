class FixQuestionsyetagainagainAgain < ActiveRecord::Migration
  def up
  	change_column :questions, :content, :text, :limit => 500
  end

  def down
  end
end
