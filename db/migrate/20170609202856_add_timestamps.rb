class AddTimestamps < ActiveRecord::Migration[5.1]
  def change
    add_column :comment_types, :created_at, :datetime, null: false
    add_column :comment_types, :updated_at, :datetime, null: false

    add_column :dance_comments, :created_at, :datetime, null: false
    add_column :dance_comments, :updated_at, :datetime, null: false

    add_column :dance_directions, :created_at, :datetime, null: false
    add_column :dance_directions, :updated_at, :datetime, null: false

    add_column :dance_levels, :created_at, :datetime, null: false
    add_column :dance_levels, :updated_at, :datetime, null: false

    add_column :dances, :created_at, :datetime, null: false
    add_column :dances, :updated_at, :datetime, null: false

    add_column :formations, :created_at, :datetime, null: false
    add_column :formations, :updated_at, :datetime, null: false

    add_column :keys, :created_at, :datetime, null: false
    add_column :keys, :updated_at, :datetime, null: false

    add_column :meters, :created_at, :datetime, null: false
    add_column :meters, :updated_at, :datetime, null: false

    add_column :moods, :created_at, :datetime, null: false
    add_column :moods, :updated_at, :datetime, null: false

    add_column :tempos, :created_at, :datetime, null: false
    add_column :tempos, :updated_at, :datetime, null: false

    add_column :profiles, :created_at, :datetime, null: false
    add_column :profiles, :updated_at, :datetime, null: false
  end
end
