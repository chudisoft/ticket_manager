# This Class handles operations related to Event Migration
class CreateAppModels < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      # t.references :organizer, null: false, foreign_key: { to_table: :users }

      t.string :organizer_id, null: false
      t.string :title, null: false
      t.datetime :datetime, null: false
      t.string :venue, null: false
      t.string :details, null: false
      t.decimal :vip_price, null: false
      t.decimal :regular_price, null: false
      t.integer :available_slot, null: false
      t.timestamps

    end
    add_foreign_key :events, :users, column: :organizer_id, primary_key: :id, on_delete: :cascade


    create_table :bookings do |t|
      # t.references :guest, null: false, foreign_key: { to_table: :users }
      t.string :guest_id, null: false
      t.references :event, null: false, foreign_key: { to_table: :events }
      t.integer :qty, null: false
      t.string :comments, null: true

      t.timestamps
    end
    add_foreign_key :bookings, :users, column: :guest_id, primary_key: :id, on_delete: :cascade


    create_table :speakers do |t|
      t.string :owner_id, null: false
      # t.references :user, null: false, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.string :name, null: false
      t.text :bio, null: false

      t.timestamps
    end
    add_foreign_key :speakers, :users, column: :owner_id, primary_key: :id, on_delete: :cascade

    create_join_table :speakers, :events do |t|
      t.index [:speaker_id, :event_id]
      t.index [:event_id, :speaker_id]
    end


    create_table :payments do |t|
      t.references :booking, null: false, foreign_key: true
      # Add any additional attributes related to the relationship

      t.string :transaction_id, null: false
      t.integer :method, null: false, default: 0 # default to 'Credit Card'
      t.string :amount, null: false
      t.string :currency, null: false
      t.integer :status, null: false
      t.string :comments
      t.timestamps
    end


    create_table :speaker_events do |t|
      t.references :speaker, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      # Add any additional attributes related to the relationship

      t.string :topic, null: false
      t.string :details, null: false
      t.datetime :speak_from, null: false
      t.datetime :speak_to, null: false
      t.timestamps
    end


  end
end
