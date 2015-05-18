class User < ActiveRecord::Base
  has_one :profile
  has_many :posts, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :received_messages, :class_name => "Message", :foreign_key => "recipient_id, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]

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
