class AddColumns1ToLead < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :query, :string
  end
end
