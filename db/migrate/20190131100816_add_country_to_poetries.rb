class AddCountryToPoetries < ActiveRecord::Migration[5.2]
  def change
    add_column :poetries, :country, :string
  end
end
