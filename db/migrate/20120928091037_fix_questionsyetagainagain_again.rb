class FixQuestionsyetagainagainAgain < ActiveRecord::Migration
  def up
  	change_column :questions, :content, :text
  end

  def down
  end
end
