class CreateForcePowers < ActiveRecord::Migration[6.1]
  def change
    create_table :force_powers do |t|
      t.references :book, null: false, foreign_key: true
      t.string :name
      t.boolean :downLink1
      t.boolean :downLink2
      t.boolean :downLink3
      t.boolean :downLink4
      t.integer :force_rating
      t.integer :cost
      t.text :description

      t.timestamps
    end
  end
end
