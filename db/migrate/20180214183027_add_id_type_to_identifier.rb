class AddIdTypeToIdentifier < ActiveRecord::Migration[5.1]
  def change
    add_column :identifiers, :idType, :string
  end
end
