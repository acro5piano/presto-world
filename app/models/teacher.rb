class Teacher < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
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
end
