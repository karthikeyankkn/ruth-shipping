class AddUseridLandingPages < ActiveRecord::Migration[5.2]
  def change
  	add_column :landing_pages, :user_id, :integer
  end
end
