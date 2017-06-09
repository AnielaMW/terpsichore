class CreateTempos < ActiveRecord::Migration[5.1]
  def change
    create_table :tempos do |t|
      t.string :name, null: false
      t.string :description
    end
  end
end
