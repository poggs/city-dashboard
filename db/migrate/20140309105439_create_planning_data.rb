class CreatePlanningData < ActiveRecord::Migration
  def change
    create_table :planning_data do |t|
      t.text     :application_number
      t.text     :application_type
      t.text     :application_status
      t.text     :appeal_status
      t.text     :category
      t.text     :address
      t.text     :proposal
      t.date     :validity
      t.date     :decision
      t.text     :ward
      t.text     :parish
      t.text     :postcode
      t.float    :latitude
      t.float    :longitude
    end
  end
end
