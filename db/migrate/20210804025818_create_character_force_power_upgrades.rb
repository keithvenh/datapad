class CreateCharacterForcePowerUpgrades < ActiveRecord::Migration[6.1]
  def change
    create_table :character_force_power_upgrades do |t|
      t.references :character, null: false, foreign_key: true
      t.references :force_power_upgrade, null: false, foreign_key: true
      t.boolean :purchased

      t.timestamps
    end
  end
end
