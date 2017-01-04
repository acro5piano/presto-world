class User < ApplicationRecord
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sent_user_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'received_user_id'
  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true , length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  #validates_inclusion_of :, :in => 10..80

  def messages
    Message.where(sent_user_id: self.id)
      .or(Message.where(received_user_id: self.id))
  end

  def received_or_sent_message_users
    user_ids = messages.pluck(:sent_user_id, :received_user_id).flatten.uniq
    user_ids.delete(self.id)
    User.find(user_ids)
  end

  def age
    return nil if !birth_day
    now = Time.now.utc.to_date
    leap = if now.month > birth_day.month ||
              (now.month == birth_day.month && now.day >= birth_day.day)
             0
           else
             1
           end
    now.year - birth_day.year - leap
  end

  private

    # メールアドレスをすべて小文字にする
    def downcase_email
      self.email = email.downcase
    end
end
