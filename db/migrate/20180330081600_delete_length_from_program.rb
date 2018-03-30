class DeleteLengthFromProgram < ActiveRecord::Migration[5.1]
  def change
    remove_column :programs, :length
  end
end
