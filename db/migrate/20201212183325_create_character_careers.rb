class CreateCharacterCareers < ActiveRecord::Migration[6.0]
  def change
    create_table :character_careers do |t|
      t.references :character, null: false, foreign_key: true
      t.references :career, null: false, foreign_key: true

      t.timestamps
    end
  end
end
