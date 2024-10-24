class AddTableToReservations < ActiveRecord::Migration[7.2]
  def change
    add_column :reservations, :table, :integer
  end
end
