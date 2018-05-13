class DeleteExtraFieldsFromProgram < ActiveRecord::Migration[5.1]
  def change
    remove_column :programs, :batches
    remove_column :programs, :status
    remove_column :programs, :teachers
    remove_column :programs, :central_id
  end
end
