require 'uuidtools'

class User < ApplicationRecord
  before_create :generate_uuid
  has_secure_password
  has_many :posts, dependent: :destroy
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: false
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email address"}

  def name
    nickname.present? ? nickname : email.split('@').first
  end
  
  def generate_uuid
    self.uuid = UUIDTools::UUID.random_create.to_s
  end
  def last_logged_in_at_formatted
    last_logged_in_at&.strftime('%B %e, %Y at %l:%M %p')
  end
  def update_with_password(params={})
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if valid_password?(current_password)
      update(params)
    else
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end

    result
  end

  def valid_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
  attr_accessor :current_password
end
