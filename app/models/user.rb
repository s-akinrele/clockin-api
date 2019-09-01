class User < ApplicationRecord
  rolify
  # encrypt password
  has_secure_password

  # Model associations
  has_many :attendances

  # Validations
  validates_presence_of :first_name, :last_name, :email, :password_digest
  validates :email, uniqueness: true

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:teacher) if self.roles.blank?
  end
end
