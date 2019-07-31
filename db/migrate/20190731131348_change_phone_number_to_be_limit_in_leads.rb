class ChangePhoneNumberToBeLimitInLeads < ActiveRecord::Migration[5.2]
  def change
  	change_column :leads, :phone_number, :bigint, :limit => 20
	  change_column :landing_pages, :user_id, :bigint
	  change_column :landing_pages, :phone_number, :bigint, :limit => 20
  end
end
