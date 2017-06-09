class CreateDanceComments < ActiveRecord::Migration[5.1]
  def change
    create_table :dance_comments do |t|
      t.string :comment, null: false
      t.integer :comment_type_id, null: false
      t.integer :dance_id, null: false
      t.integer :user_id, null: false
    end
  end
end
