class AddExtrasToQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :audio_url, :string, default: ""
  	add_column :questions, :picture_url, :string, default: ""
  end
end
