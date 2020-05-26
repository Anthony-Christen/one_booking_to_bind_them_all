class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.string :statut
      t.integer :duration
      t.references :service, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
