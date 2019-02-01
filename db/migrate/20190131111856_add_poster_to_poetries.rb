class AddPosterToPoetries < ActiveRecord::Migration[5.2]
  def change
    add_column :poetries, :poster, :string
  end
end
