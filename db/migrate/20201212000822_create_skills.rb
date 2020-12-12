class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :attr
      t.text :description

      t.timestamps
    end
  end
end
