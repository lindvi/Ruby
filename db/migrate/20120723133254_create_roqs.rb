class CreateRoqs < ActiveRecord::Migration
  def change
    create_table :roqs do |t|
      t.integer :question_id
      t.integer :option_id

      t.timestamps
    end
  end
end
