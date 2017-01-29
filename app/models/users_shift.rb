class UsersShift < ApplicationRecord
  belongs_to :shift
  belongs_to :user
end
