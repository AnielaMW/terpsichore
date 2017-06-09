class CreateDanceMoods < ActiveRecord::Migration[5.1]
  def change
    create_table :dance_moods do |t|
      t.integer :dance_id, null: false
      t.integer :mood_id, null: false
    end
  end
end
