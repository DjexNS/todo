class CreateTaskAssignments < ActiveRecord::Migration
  def change
    create_table :task_assignments do |t|
      t.references :user
      t.references :task
      t.timestamps null: false
    end
  end
end
