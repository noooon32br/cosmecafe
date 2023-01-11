class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to cosme_items_path(), notice: 'guestuserでログインしました。'
  end
  
  def self.guest
    find_or_create_by!(login_id: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.login_id = "guestuser"
    end
  end
end