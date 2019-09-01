class User < ApplicationRecord
  rolify
  # encrypt password
  has_secure_password

  # Model associations
  # has_many :todos, foreign_key: :created_by
  # Validations
  validates_presence_of :first_name, :last_name, :email, :password_digest

  after_create :assign_default_role

  has_many :attendances

  def assign_default_role
    self.add_role(:teacher) if self.roles.blank?
  end
end
