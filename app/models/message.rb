class Message < ApplicationRecord
  validates :message, presence: true, length: { maximum: 500 }
end
