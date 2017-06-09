class CreateCommentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_types do |t|
      t.string :name, null: false
      t.string :description, null: false
    end
  end
end
