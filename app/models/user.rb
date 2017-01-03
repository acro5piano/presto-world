class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true , length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  #validates_inclusion_of :, :in => 10..80

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
