class CreateCharacterSpecializations < ActiveRecord::Migration[6.0]
  def change
    create_table :character_specializations do |t|
      t.references :character, null: false, foreign_key: true
      t.references :specialization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
