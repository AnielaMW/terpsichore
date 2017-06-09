class CreateDances < ActiveRecord::Migration[5.1]
  def change
    create_table :dances do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.integer :year
      t.string :music
      t.string :choreographer
      t.string :publication
      t.integer :formation_id, null: false
      t.integer :key_id, null: false
      t.integer :dance_level_id, null: false
      t.integer :meter_id, null: false
      t.integer :tempo_id, null: false
    end
  end
end
