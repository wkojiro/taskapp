class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 # validates :username, presence: true, uniqueness: true
  has_many :projects, :dependent => :destroy
  has_many :bookmarklets, :dependent => :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :omniauthable, omniauth_providers: [:facebook, :twitter]  
         
#    def self.from_omniauth(auth)
#        where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
#            user.provider = auth["provider"]
#            user.uid = auth["uid"]
#            user.username = auth["info"]["nickname"]
# 
#        end
#    end

#    def self.new_with_session(params, session)
#        if session["devise.user_attributes"]
#            new(session["devise.user_attributes"], without_protection: true) do |user|
#                user.attributes = params
#                user.valid?
#            end
#        else
#            super
#        end
#    end 
    
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        username: auth.info.name,
        screenname: auth.info.screen_name,
        imageicon: auth.info.image,
        email: User.get_email(auth),
        password: Devise.friendly_token[4, 30])
    end
    user
  end

  private
    def self.get_email(auth)
      email = auth.info.email
      email = "#{auth.provider}-#{auth.uid}@example.com" if email.blank?
      email
    end

    
end


