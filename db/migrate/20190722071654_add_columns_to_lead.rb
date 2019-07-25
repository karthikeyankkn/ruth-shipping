class AddColumnsToLead < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :source, :string
    add_column :leads, :host, :string
    add_column :leads, :user_agent, :string
  end
end
