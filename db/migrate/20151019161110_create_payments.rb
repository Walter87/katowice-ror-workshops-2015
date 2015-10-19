class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :month

      t.timestamps null: false
    end
  end
end
