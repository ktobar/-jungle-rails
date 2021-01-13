class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email, :first_name, :last_name, :password, :password_confirmation
  validates_uniqueness_of :email
  validates_length_of :password, minimum: 6

  def self.authenticate_with_credentials(email, password)
    formated_email = email.strip.downcase
    
    user = User.find_by_email(formated_email)
    pass = user.authenticate(password)

    if user && pass
      user
    else
      nil
    end
  end

end
