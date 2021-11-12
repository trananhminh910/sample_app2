class User < ApplicationRecord
  before_save :downcase_email
  has_secure_password
  has_secure_password :recovery_password, validations: false

  validates :name,
            presence: true,
            length: {minimum: 4}
            length: {minimum: Settings.length.digit_4}

  validates :account_name,
            presence: true,
            uniqueness: true,
            length: {in: 6..20}
            length: {in: Settings.length.digit_6..Settings.length.digit_20}

  validates :email,
            presence: true,
            uniqueness: true,
            length: {maximum: 150},
            length: {maximum: Settings.length.digit_150},
            format: {with: URI::MailTo::EMAIL_REGEXP}

  validates :age,
            presence: true,
            length: {in: 1..3}
            length: {in: Settings.length.digit_1..Settings.length.digit_3}

  validates :gender,
            presence: true,
            inclusion: {in: %w(male female other)}

  def downcase_email
    email.downcase!
  end
end
