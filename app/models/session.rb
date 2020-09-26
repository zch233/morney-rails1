class Session
  include ActiveModel::Model
  attr_accessor :email, :password

  validates_presence_of :email, :password
  validate :check_email_present, if: :email
  validates_format_of :email, with: /.+@.+/, if: :email
  validates_length_of :password, minimum: 6, if: :password

  def check_email_present
    if (User.find_by_email email).nil?
      errors.add :email, :email_not_present
    end
  end
end