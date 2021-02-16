class CreateCharacterSpecTalents < ActiveRecord::Migration[6.0]
  def change
    create_table :character_spec_talents do |t|
      t.references :character, null: false, foreign_key: true
      t.references :specialization_talent, null: false, foreign_key: true
      t.boolean :purchased

      t.timestamps
    end
  end
end
