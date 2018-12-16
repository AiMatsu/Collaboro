class CreateChatrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chatrooms do |t|
    	t.integer  :c_user_id      , null: false
    	t.integer  :f_user_id      , null: false
        t.timestamps
    end
  end
end
