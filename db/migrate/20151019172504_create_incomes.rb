class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.references :payment, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.boolean :received
      t.date :income_date

      t.timestamps null: false
    end
  end
end
