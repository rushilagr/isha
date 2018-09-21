class CreateCallTask < ActiveRecord::Migration[5.1]
  def change
    create_table :call_tasks do |t|
      t.string :name
      t.references :creator
      t.timestamps
    end
    add_foreign_key :call_tasks, :users, column: :creator_id, primary_key: :id

    create_table :call_task_callers do |t|
      t.references :caller
      t.references :call_task
      t.timestamps
    end
    add_foreign_key :call_task_callers, :users, column: :caller_id, primary_key: :id

    create_table :call_task_participants do |t|
      t.string :status
      t.string :caller_comment
      t.references :participant
      t.references :call_task
      t.references :call_task_caller, null: true
      t.timestamps
    end
  end
end
