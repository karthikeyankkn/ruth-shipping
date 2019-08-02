class AddColumns1ToLandingPage < ActiveRecord::Migration[5.2]
  def change
    add_column :landing_pages, :section_3_title_1, :string
    add_column :landing_pages, :section_3_title_2, :string
    add_column :landing_pages, :section_3_title_3, :string
  end
end
