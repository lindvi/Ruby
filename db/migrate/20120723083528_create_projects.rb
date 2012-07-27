class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :version
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
