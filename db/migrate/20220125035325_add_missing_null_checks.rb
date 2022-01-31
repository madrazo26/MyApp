# frozen_string_literal: true

class AddMissingNullChecks < ActiveRecord::Migration[7.0]
  def change
    change_column_null :waybills, :title, false
  end
end
