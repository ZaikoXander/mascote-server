class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :number_of_guests
      t.date :date
      t.string :time
      t.text :observations

      t.timestamps
    end
  end
end
