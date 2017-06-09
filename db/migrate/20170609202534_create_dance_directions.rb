class CreateDanceDirections < ActiveRecord::Migration[5.1]
  def change
    create_table :dance_directions do |t|
      t.integer :dance_id, null: false
      t.integer :sequence, null: false
      t.string :mark
      t.string :measure
      t.text :movement, null: false
      t.string :position
    end
  end
end
