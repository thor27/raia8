class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.date :date_of_birth
      t.string :address

      t.timestamps
    end
  end
end
