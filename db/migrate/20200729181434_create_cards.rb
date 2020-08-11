# frozen_string_literal: true

# Base db of application
class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.text :original_text, null: false
      t.text :translated_text
      t.string :review_date

      t.timestamps
    end
  end
end
