class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :game
      t.string :title
      t.string :subtitle
      t.string :type_of

      t.timestamps
    end
  end
end
