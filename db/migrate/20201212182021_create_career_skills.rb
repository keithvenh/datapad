class CreateCareerSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :career_skills do |t|
      t.references :career, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
