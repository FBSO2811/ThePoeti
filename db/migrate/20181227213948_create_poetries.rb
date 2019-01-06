class CreatePoetries < ActiveRecord::Migration[5.2]
  def change
    create_table :poetries do |t|
      t.string :title
      t.string :author
      t.text :body

      t.timestamps
    end
  end
end
