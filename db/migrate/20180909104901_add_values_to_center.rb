class AddValuesToCenter < ActiveRecord::Migration[5.1]
  def change
    add_column :centers, :coordinator, :string
    add_reference :centers, :sector, foreign_key: true
  end
end
