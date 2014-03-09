# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140309105439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "code_points", force: true do |t|
    t.text  "postcode"
    t.float "longitude"
    t.float "latitude"
  end

  create_table "planning_data", force: true do |t|
    t.text  "application_number"
    t.text  "application_type"
    t.text  "application_status"
    t.text  "appeal_status"
    t.text  "category"
    t.text  "address"
    t.text  "proposal"
    t.date  "validity"
    t.date  "decision"
    t.text  "ward"
    t.text  "parish"
    t.text  "postcode"
    t.float "latitude"
    t.float "longitude"
  end

end
