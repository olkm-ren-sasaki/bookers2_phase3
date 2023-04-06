class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :body, length: { maximum: 120 }
end
