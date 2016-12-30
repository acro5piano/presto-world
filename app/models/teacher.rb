class Teacher < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :age, presence: true
  validates :educational_background, presence: true
  validates_inclusion_of :age, :in => 10..80
end
