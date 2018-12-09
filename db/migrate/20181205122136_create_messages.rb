class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.text    :text       ,null: false
      t.integer :messenger  ,null: false
      t.integer :chatroom_id,null:false

      t.timestamps
    end
  end
end
