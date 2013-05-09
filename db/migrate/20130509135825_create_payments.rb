class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :student
      t.float :value
      t.date :date_of_payment
      t.integer :reference_month
      t.integer :reference_year

      t.timestamps
    end
    add_index :payments, :student_id
  end
end
