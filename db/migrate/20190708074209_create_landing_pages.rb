class CreateLandingPages < ActiveRecord::Migration[5.2]
  def change
    create_table :landing_pages do |t|
    	t.string :name
    	t.string :email
    	t.integer :phone_number
    	t.text :query
    	t.string :logo
    	t.string :banner_image
    	t.text :about_description
    	t.string :section_1_image
    	t.string :section_2_image
    	t.string :section_1_content
    	t.string :section_2_content
    	t.string :video_url
    	t.string :section_3_icon_1
    	t.string :section_3_icon_2
    	t.string :section_3_icon_3
    	t.string :gallery_img_1
    	t.string :gallery_img_2
    	t.string :gallery_img_3
    	t.string :gallery_img_4
    	t.string :gallery_img_5
    	t.string :gallery_img_6
    	t.string :gallery_img_7
    	t.string :gallery_img_8
    	t.string :gallery_img_9
    	t.string :gallery_img_10
    	t.string :our_client_logo_1
    	t.string :our_client_logo_2
    	t.string :our_client_logo_3
    	t.string :our_client_logo_4
    	t.string :our_client_logo_5
    	t.text :testimonial_content_1
    	t.text :testimonial_content_2
    	t.timestamps
    end
  end
end
