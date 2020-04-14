class AddColumnToHouses < ActiveRecord::Migration[6.0]
  def change
    add_column :houses, :img, :string
  end
end
