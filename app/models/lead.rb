class Lead < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  
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
