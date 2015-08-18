class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.boolean :completed, default: false
      t.string :roman
      t.datetime :deadline
      t.timestamps null: false
    end
  end
end
