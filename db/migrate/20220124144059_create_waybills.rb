# frozen_string_literal: true

class CreateWaybills < ActiveRecord::Migration[7.0]
  def change
    create_table :waybills do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
