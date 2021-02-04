class CreateSpecializationTalents < ActiveRecord::Migration[6.0]
  def change
    create_table :specialization_talents do |t|
      t.references :specialization, null: false, foreign_key: true
      t.references :talent, null: false, foreign_key: true
      t.integer :row
      t.integer :colStart
      t.integer :colSpan
      t.boolean :upLink
      t.boolean :downLink
      t.boolean :leftLink
      t.boolean :rightLink
      t.integer :cost

      t.timestamps
    end
  end
end
