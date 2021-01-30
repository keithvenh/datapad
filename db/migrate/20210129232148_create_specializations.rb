class CreateSpecializations < ActiveRecord::Migration[6.0]
  def change
    create_table :specializations do |t|
      t.references :book, null: false, foreign_key: true
      t.string :name
      t.references :career, null: false, foreign_key: true

      t.timestamps
    end
  end
end
