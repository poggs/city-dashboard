require 'csv'

class PlanningData < ActiveRecord::Base

  def self.import_data
    CSV.foreach('data/planning_data.csv') do |row|

      row[15] = row[15].gsub(' ', '') unless row[15].nil?

      postcode_data = CodePoint.where(:postcode => row[15]).first

      if postcode_data.blank?
        puts "No CodePoint data for #{row[15]} - skipping"
      else
        PlanningData.create!(:application_number => row[0], :application_type => row[1], :application_status => row[3], :appeal_status => row[5], :category => row[4], :address => row[7], :validity => row[8], :decision => row[9], :ward => row[13], :parish => row[14], :postcode => row[15], :latitude => postcode_data.latitude, :longitude => postcode_data.longitude)
      end

    end
  end

  def self.export_data

    CSV.open('data/planning_data_points.csv', 'wb') do |csv|
      csv << [ 'app_number', 'app_status', 'application_type', 'latitude', 'longitude' ]
      self.all.each do |rec|
        csv << [ rec.application_number, rec.application_status, rec.application_type, rec.longitude, rec.latitude ]
      end
    end

  end

end
