class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :number_of_diagnoses
      t.integer :generated

      t.timestamps
    end
  end
end
