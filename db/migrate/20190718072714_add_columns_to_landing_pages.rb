class AddColumnsToLandingPages < ActiveRecord::Migration[5.2]
  def change
    add_column :landing_pages, :custom_url, :string
  end
end
