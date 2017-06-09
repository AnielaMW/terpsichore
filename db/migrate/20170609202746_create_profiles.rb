class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false
      t.string :l_city
      t.string :l_state
      t.string :l_country
      t.boolean :dancer, default: false
      t.boolean :caller, default: false
      t.boolean :musician, default: false
      t.boolean :band, default: false
      t.boolean :choreographer, default: false
      t.boolean :composer, default: false
      t.text :about
      t.boolean :privacy_fn, default: false
      t.boolean :privacy_ln, default: false
      t.boolean :privacy_ce, default: false
      t.boolean :privacy_lcity, default: false
      t.boolean :privacy_lstate, default: false
      t.boolean :privacy_lcountry, default: false
    end
  end
end
