class CreateCropsCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :crops_calendars do |t|

      t.integer  :f_user_id  , null: false
      t.string   :crops      , null: false
      t.datetime :season
      t.datetime :bestSeason , null: false

      t.timestamps
    end
  end
end

