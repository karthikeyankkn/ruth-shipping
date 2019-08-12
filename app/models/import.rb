class Import < ApplicationRecord
	require 'csv'
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  # filer using scope
  scope :imp, -> (imp) { where imp: imp }
  scope :line, -> (line) { where line: line }
  scope :status, -> (status) { where status: status }

  # validation for leads
  
  private

end
