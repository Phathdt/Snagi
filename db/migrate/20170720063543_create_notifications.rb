class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.integer :user_has_id
      t.integer :object_id
      t.boolean :is_readed , default: false

      t.timestamps
    end
  end
end
