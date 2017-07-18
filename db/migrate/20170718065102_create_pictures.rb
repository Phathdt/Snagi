class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.references :album, foreign_key: true
      t.text :title
      t.text :description
      t.boolean :is_private, default: false
      t.integer :like_count, default: 0

      t.timestamps
    end
  end
end
