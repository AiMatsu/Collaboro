class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|

      t.integer  :c_user_id      , null: false
      t.string   :r_title        , null: false
      t.text     :r_body         , null: false
      t.string   :r_location     , null: false
      t.datetime :r_start_season , null: false
      t.datetime :r_finish_season, null: false
      t.integer  :r_category     , null: false, default: 0
      t.integer  :r_status       , null: false, default: 0

      t.timestamps

    end
  end
end


