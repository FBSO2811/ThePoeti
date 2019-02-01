class AddBornToPoetries < ActiveRecord::Migration[5.2]
  def change
    add_column :poetries, :born, :string
  end
end
