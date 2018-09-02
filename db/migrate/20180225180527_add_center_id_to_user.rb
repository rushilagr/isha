class AddCenterIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :center, foreign_key: true
  end
end
