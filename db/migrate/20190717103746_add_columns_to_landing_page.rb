class AddColumnsToLandingPage < ActiveRecord::Migration[5.2]
  def change
    add_column :landing_pages, :testimonial_1_name, :string
    add_column :landing_pages, :testimonial_2_name, :string
    add_column :landing_pages, :section_3_description_1, :string
    add_column :landing_pages, :section_3_description_2, :string
    add_column :landing_pages, :section_3_description_3, :string
  end
end
