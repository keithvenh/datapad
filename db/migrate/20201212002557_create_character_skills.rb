class CreateCharacterSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :character_skills do |t|
      t.references :character, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.boolean :career
      t.integer :ranks

      t.timestamps
    end
  end
end
