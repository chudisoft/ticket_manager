# frozen_string_literal: true

# This Class handles operations related to Speaker Migration
class CreateSpeakerEvents < ActiveRecord::Migration[7.1]
  def change
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
