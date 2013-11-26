class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
