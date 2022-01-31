# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :waybill

  validates :body, presence: true, length: { minimum: 5 }

  def formatted_created_at
    created_at.strftime('%Y %m %d')
  end
end
