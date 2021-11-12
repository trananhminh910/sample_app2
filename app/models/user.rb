class User < ApplicationRecord
  VALID_EMAIL_REGEX = "/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i".freeze
  before_save :downcase_email
  has_secure_password
  has_secure_password :recovery_password, validations: false

  validates :name,
            presence: true,
            length: {minimum: 4}

  validates :account_name,
            presence: true,
            length: {in: 6..20, message: "Enter 6 - 12 character, please"}

  validates :email,
            presence: true,
            uniqueness: true,
            length: {
              maximum: 150,
              too_long: "%{count} character maximum allowed"
            },
            format: {with: VALID_EMAIL_REGEX}

  validates :age,
            presence: true,
            length: {in: 1..3}

  validates :gender,
            presence: true,
            inclusion: {
              in: %w(male female other),
              message: "%{value} is not gender"
            }

  def downcase_email
    email.downcase!
  end
end
