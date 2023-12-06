# frozen_string_literal: true

# This Class handles operations related to Booking Migration
class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :guest, null: false, foreign_key: { to_table: :users }
      t.references :event, null: false, foreign_key: { to_table: :events }
      t.integer :qty, null: false
      t.string :comments, null: true

      t.timestamps
    end
  end
end
