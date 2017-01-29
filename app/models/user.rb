class User < ApplicationRecord
  extend Enumerize

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sent_user_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'received_user_id'

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true , length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  #validates_inclusion_of :, :in => 10..80

  enumerize :sex, in: {male: 1, female: 2}, predicates: true, scope: true
  enumerize :shift_id, in: {
              shift_monday_afternoon: 1,
              shift_tuesday_afternoon: 2,
              shift_wednesday_afternoon: 3,
              shift_thursday_afternoon: 4,
              shift_friday_afternoon: 5,
              shift_saturday_afternoon: 6,
              shift_sunday_afternoon: 7,
              shift_monday_evening: 8,
              shift_tuesday_evening: 9,
              shift_wednesday_evening: 10,
              shift_thursday_evening: 11,
              shift_friday_evening: 12,
              shift_saturday_evening: 13,
              shift_sunday_evening: 14,
              shift_monday_night: 15,
              shift_tuesday_night: 16,
              shift_wednesday_night: 17,
              shift_thursday_night: 18,
              shift_friday_night: 19,
              shift_saturday_night: 20,
              shift_sunday_night: 21,
            },
            predicates: true, scope: true

  has_attached_file :avatar,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: :default_avatar_url
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :shifts
  accepts_nested_attributes_for :shifts

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

  def avator_url(size)
    if avatar?
      avatar.url(size)
    else
      default_avatar_url
    end
  end

  def default_avatar_url
    if male?
      'boy.jpg'
    else
      'girl.jpg'
    end
  end

  def self.shift_times
    %w(monday tuesday wednesday thursday friday saturday sunday)
      .product(%w(afternoon evening night))
      .collect { |set| set.join('_') }
      .map { |s| ('shift_' + s).to_sym }
  end

  def self.afternoon_shifts
    self.shift_id.values[0..6].map(&:to_sym)
  end

  def self.evening_shifts
    self.shift_id.values[7..13].map(&:to_sym)
  end

  def self.night_shifts
    self.shift_id.values[14..20].map(&:to_sym)
  end

  private

    # メールアドレスをすべて小文字にする
    def downcase_email
      self.email = email.downcase
    end
end
