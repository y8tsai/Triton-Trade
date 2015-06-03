class User < ActiveRecord::Base
  has_one :profile
  has_many :items, dependent: :destroy
  has_many :received_messages, :class_name => "Message", :foreign_key => "recipient_id", dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]
  after_create :send_welcome_msg

  validates_confirmation_of :password
  after_create :add_profile

  def add_profile
 	self.create_profile
  end

  def full_name
    if self.name.blank?
      self.email
    else
      self.name
    end
  end

  #user rating
  ratyrate_rateable "rating"
  ratyrate_rater

  def user_params
    params.require(:user).permit(:username, :name, :avatar_url, :email, :password, :password_confirmation)
  end

  # change this later
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
	data = access_token.info
    user = User.where(:email => data["email"]).first

	unless user
      user = User.create(name: access_token.extra.raw_info.name,
        provider: data["provider"],
        uid: data["uid"],
        email: data["email"],
        password: Devise.friendly_token[0,20],
      )
    end

	user
  end

  def send_welcome_msg
    message = Message.new
    message.user_id = self.id
    message.recipient_id = self.id
    message.subject = "Hello, #{self.full_name}!"
#    message.subject = "Hello, #{self.full_name}! Welcome to the Triton Trade community! Here is a quick guide to get you start buying and selling items to other members in our community.\n\nNavigation bar: Access quick features such as clicking our logo to be redirected to the home page, explore categories of items, or go to account management.\n\nHomepage: Search items by name or click one of the featured buttons below the search bar to be redirected to that page.\n\nBuy: View the listing of items for sale from other users. \n\nSell: Post an item you wish to be sold.\n\nFree: View items that are listed as free.\n\nThanks again for joining our community. Happy Trading!\nTriton Trade\n"
    message.body = "Tutorial"
    message.save
  end

  # Bind/Create User
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(provider: data["provider"],
        uid: data["uid"],
        email: data["email"],
        password: Devise.friendly_token[0,20]
      )
    end

    user
  end
end
