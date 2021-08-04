class CreateForcePowerUpgrades < ActiveRecord::Migration[6.1]
  def change
    create_table :force_power_upgrades do |t|
      t.references :force_power, null: false, foreign_key: true
      t.string :name
      t.integer :row
      t.integer :colStart
      t.integer :colSpan
      t.boolean :upLink1
      t.boolean :upLink2
      t.boolean :upLink3
      t.boolean :upLink4
      t.boolean :downLink1
      t.boolean :downLink2
      t.boolean :downLink3
      t.boolean :downLink4
      t.boolean :leftLink
      t.boolean :rightLink
      t.integer :cost
      t.text :description

      t.timestamps
    end
  end
end
