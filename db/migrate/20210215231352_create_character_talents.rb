class CreateCharacterTalents < ActiveRecord::Migration[6.0]
  def change
    create_table :character_talents do |t|
      t.references :character, null: false, foreign_key: true
      t.references :talent, null: false, foreign_key: true
      t.boolean :purchased

      t.timestamps
    end
  end
end
