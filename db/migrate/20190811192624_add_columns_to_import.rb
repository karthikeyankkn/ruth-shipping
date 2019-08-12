class AddColumnsToImport < ActiveRecord::Migration[5.2]
  def change
    add_column :imports, :user_id, :bigint
  end
end
