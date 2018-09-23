class AddMaxCallsPerCallerToCallTask < ActiveRecord::Migration[5.1]
  def change
    add_column :call_tasks, :max_calls_per_caller, :integer
  end
end
