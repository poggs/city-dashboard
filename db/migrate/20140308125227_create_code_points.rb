class CreateCodePoints < ActiveRecord::Migration
  def change
    create_table :code_points do |t|
      t.text  :postcode
      t.float :longitude
      t.float :latitude
    end
  end
end
