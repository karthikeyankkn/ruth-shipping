class Import < ApplicationRecord
	require 'csv'
  belongs_to :user
  # default_scope -> { order(created_at: :desc) }

  # filer using scope
  scope :imp, -> (imp) { where imp: imp }
  scope :line, -> (line) { where line: line }
  scope :status, -> (status) { where status: status }


  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end
  
  # validation for leads
  
  private

end
