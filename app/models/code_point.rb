require 'csv'

class CodePoint < ActiveRecord::Base

  def self.import_data
    CSV.foreach('data/leeds_codepoint.csv') do |row|
      CodePoint.create!(:postcode => row[0], :longitude => row[1], :latitude => row[2])
    end
  end

end
