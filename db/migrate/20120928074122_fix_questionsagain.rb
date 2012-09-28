class FixQuestionsagain < ActiveRecord::Migration
  def up
  	change_column :questions, :content, :string
  end

  def down
  end
end
