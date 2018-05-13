class AddDigestToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :digest, :string
  end
end
