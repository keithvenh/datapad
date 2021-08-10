class AddRoleToCharacter < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :role, :string
  end
end
