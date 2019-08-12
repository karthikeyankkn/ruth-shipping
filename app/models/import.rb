class Import < ApplicationRecord
	require 'csv'
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  
  # validation for leads
  
  private

end
