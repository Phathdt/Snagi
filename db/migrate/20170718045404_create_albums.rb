class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.references :user, foreign_key: true
      t.text :title
      t.text :description
      t.integer :quality, default: 0
      t.boolean :is_private, default: false
      t.integer :like_count, default: 0

      t.timestamps
    end
  end
end
