class CreateSpecializationSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :specialization_skills do |t|
      t.references :specialization, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
