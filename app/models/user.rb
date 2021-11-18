class User < ApplicationRecord
  attr_accessor :remember_token
  before_save :downcase_email
  has_secure_password
  has_secure_password :recovery_password, validations: false

  validates :name,
            presence: true,
            length: {minimum: Settings.length.digit_4}

  validates :account_name,
            presence: true,
            uniqueness: true,
            length: {in: Settings.length.digit_6..Settings.length.digit_20}

  validates :email,
            presence: true,
            uniqueness: true,
            length: {maximum: Settings.length.digit_150},
            format: {with: URI::MailTo::EMAIL_REGEXP}

  validates :age,
            presence: true,
            length: {in: Settings.length.digit_1..Settings.length.digit_3}

  validates :gender,
            presence: true,
            inclusion: {in: %w(male female other)}

  def downcase_email
    email.downcase!
  end

  def self.digest string
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create string, cost: cost
  end

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_column :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update_column :remember_digest, nil
  end
end
