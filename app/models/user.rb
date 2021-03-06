class User < ActiveRecord::Base

  has_many :trips, dependent: :destroy
  has_many :demands, dependent: :destroy

  validates :auth_token, uniqueness: true

  before_create :generate_authentication_token!

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :confirmable, :lockable, :timeoutable, :omniauthable

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

end
