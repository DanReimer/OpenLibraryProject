class CreateCovers < ActiveRecord::Migration[5.1]
  def change
    create_table :covers do |t|
      t.references :book, foreign_key: true
      t.string :smallLink
      t.string :mediumLink
      t.string :largeLink

      t.timestamps
    end
  end
end
