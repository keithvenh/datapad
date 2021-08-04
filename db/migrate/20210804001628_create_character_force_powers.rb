class CreateCharacterForcePowers < ActiveRecord::Migration[6.1]
  def change
    create_table :character_force_powers do |t|
      t.references :character, null: false, foreign_key: true
      t.references :force_power, null: false, foreign_key: true

      t.timestamps
    end
  end
end
