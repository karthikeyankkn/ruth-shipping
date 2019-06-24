class Lead < ApplicationRecord
  require 'csv'
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # avoid duplication for csv lead upload
      # lead_check = Lead.where(phone_number: row.to_hash["phone_number"])
      # if lead_check.length == 0
      #   Lead.create! row.to_hash
      # end
      Lead.create! row.to_hash
    end
  end
  
  # validation for leads
  validates :user_id, presence: true
  validates :phone_number,
  					:presence => true, 
            :length => { :minimum => 10, :maximum => 20 }
  validates :name,:presence => true

  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
			length: {maximum: 150},
			format: {with: VALID_EMAIL_REGEX}
end
