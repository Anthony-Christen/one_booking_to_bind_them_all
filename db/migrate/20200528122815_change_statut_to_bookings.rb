class ChangeStatutToBookings < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bookings, :statut, "pending"
  end
end
