# frozen_string_literal: true

# This Class handles operations related to Booking Migration
class CreateSpeakers < ActiveRecord::Migration[7.1]
  def change
    create_table :speakers do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.string :name, null: false
      t.string :pics, null: false

      t.timestamps
    end

    create_join_table :speakers, :events do |t|
      t.index [:speaker_id, :event_id]
      t.index [:event_id, :speaker_id]
    end
  end
end
