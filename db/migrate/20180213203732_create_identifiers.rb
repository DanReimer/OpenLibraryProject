class CreateIdentifiers < ActiveRecord::Migration[5.1]
  def change
    create_table :identifiers do |t|
      t.string :type
      t.string :number
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
