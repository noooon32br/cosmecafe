class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login_id]
  
  has_one_attached :profile_image
  has_many :cosme_items, dependent: :destroy
         
  def self.guest
    find_or_create_by!(login_id: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.login_id = "guestuser"
    end
  end
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
