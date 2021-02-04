class CreateTalents < ActiveRecord::Migration[6.0]
  def change
    create_table :talents do |t|
      t.references :book, null: false, foreign_key: true
      t.string :name
      t.boolean :active
      t.string :activation_type
      t.text :shortDesc
      t.text :longDesc
      t.boolean :force
      t.boolean :ranked

      t.timestamps
    end
  end
end
