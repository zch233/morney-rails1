class Session
  include ActiveModel::Model
  attr_accessor :email, :password, :user

  validates_presence_of :email, :password
  validate :check_email_present, if: :email
  validates_format_of :email, with: /.+@.+/, if: :email
  validates_length_of :password, minimum: 6, if: :password
  validate :check_email_password_match

  def check_email_present
    user ||= User.find_by_email email
    if user.nil?
      errors.add :email, :not_present
    end
  end

  def check_email_password_match
    user ||= User.find_by_email email
    if user and not user.authenticate(password)
      errors.add :password, :not_match
    end
  end
end