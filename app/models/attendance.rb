class Attendance < ApplicationRecord
  belongs_to :user

  enum status: [:in, :out]
end
