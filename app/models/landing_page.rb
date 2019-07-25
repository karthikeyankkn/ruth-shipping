class LandingPage < ApplicationRecord
	belongs_to :user
	default_scope -> { order(created_at: :desc) }

  # Tells rails to use this uploader for this model.
  mount_uploader :logo, AttachmentUploader
  mount_uploader :banner_image, AttachmentUploader
  mount_uploader :section_1_image, AttachmentUploader
  mount_uploader :section_2_image, AttachmentUploader
  mount_uploader :video_url, AttachmentUploader
  # section 3 icons
  mount_uploader :section_3_icon_1, AttachmentUploader
  mount_uploader :section_3_icon_2, AttachmentUploader
  mount_uploader :section_3_icon_3, AttachmentUploader 
  # gallery_image upload
  mount_uploader :gallery_img_1, AttachmentUploader
  mount_uploader :gallery_img_2, AttachmentUploader
  mount_uploader :gallery_img_3, AttachmentUploader
  mount_uploader :gallery_img_4, AttachmentUploader
  mount_uploader :gallery_img_5, AttachmentUploader
  mount_uploader :gallery_img_6, AttachmentUploader
  mount_uploader :gallery_img_7, AttachmentUploader
  mount_uploader :gallery_img_8, AttachmentUploader
  mount_uploader :gallery_img_9, AttachmentUploader
  mount_uploader :gallery_img_10, AttachmentUploader 

  # client logo
  mount_uploader :our_client_logo_1, AttachmentUploader 
  mount_uploader :our_client_logo_2, AttachmentUploader
  mount_uploader :our_client_logo_3, AttachmentUploader
  mount_uploader :our_client_logo_4, AttachmentUploader
  mount_uploader :our_client_logo_5, AttachmentUploader

	validates :user_id, presence: true
  # validates :phone_number,
  # 					:presence => true, 
  #           :length => { :minimum => 10, :maximum => 20 }
  # validates :name,:presence => true

  # VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true,
		# 	length: {maximum: 150},
		# 	format: {with: VALID_EMAIL_REGEX}
end