class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :type_of
      t.integer :wounds
      t.integer :strain
      t.integer :soak
      t.integer :def_ranged
      t.integer :def_melee
      t.integer :brawn
      t.integer :agility
      t.integer :intellect
      t.integer :cunning
      t.integer :willpower
      t.integer :presence
      t.integer :force_rating

      t.timestamps
    end
  end
end
