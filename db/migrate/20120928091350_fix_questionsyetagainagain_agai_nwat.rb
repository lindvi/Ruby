class FixQuestionsyetagainagainAgaiNwat < ActiveRecord::Migration
  def up
  	change_column :questions, :content, :text, :limit => nil
  end

  def down
  end
end
