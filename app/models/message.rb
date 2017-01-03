class Message < ApplicationRecord
  belongs_to :sent_user, class_name: 'User', foreign_key: 'sent_user_id'
  validates :message, presence: true, length: { maximum: 500 }

  # def sender
  #   User.find(sent_user_id)
  # end
end
