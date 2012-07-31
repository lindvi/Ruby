class CreateAnswersCorrect < ActiveRecord::Migration
  def change
  	create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :answer_id
      t.string :remember_token

      t.timestamps

    end
  end
end
