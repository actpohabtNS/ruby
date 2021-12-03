class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :surname
      t.boolean :dormitory
      t.integer :experience
      t.integer :teaching_experience
      t.string :school
      t.string :second_language

      t.timestamps
    end
  end
end
