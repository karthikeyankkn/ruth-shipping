class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.integer :phone_number
      t.string :category
      t.string :city
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :leads, [:user_id, :created_at]
  end
end
