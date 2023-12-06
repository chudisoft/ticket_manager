# frozen_string_literal: true

# This Class handles operations related to Event Migration
class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :organizer, null: false, foreign_key: { to_table: :users }

      t.string :title, null: false
      t.datetime :datetime, null: false
      t.string :venue, null: false
      t.string :details, null: false
      t.decimal :vip_price, null: false
      t.decimal :regular_price, null: false
      t.integer :available_slot, null: false
      t.timestamps
    end
  end
end
