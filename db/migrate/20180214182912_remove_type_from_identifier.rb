class RemoveTypeFromIdentifier < ActiveRecord::Migration[5.1]
  def change
    remove_column :identifiers, :type, :string
  end
end
