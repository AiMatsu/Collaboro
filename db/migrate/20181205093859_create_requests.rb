class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|

      t.integer  :c_user_id      , null: false
      t.string   :title        , null: false
      t.text     :body         , null: false
      t.string   :location     , null: false
      t.datetime :start_season , null: false
      t.datetime :finish_season, null: false
      t.integer  :category     , null: false, default: 0
      t.integer  :status       , null: false, default: 0

      t.timestamps

    end
  end
end


