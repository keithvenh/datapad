class AddRanksToCharacterTalents < ActiveRecord::Migration[6.1]
  def change
    add_column :character_talents, :ranks, :integer
  end
end
