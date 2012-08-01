class AddSetReminderToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :set_reminder, :boolean, default: false
  end
end
