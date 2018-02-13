class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :publishDate
      t.integer :numberOfPages
      t.string :byStatement

      t.timestamps
    end
  end
end
