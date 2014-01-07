# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :google_oauth2, :vkontakte]

    def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
	    user = User.where(:provider => auth.provider, :uid => auth.uid).first
	    unless user
	      user = User.create(name:auth.extra.raw_info.name,
	                         provider:auth.provider,
	                         uid:auth.uid,
	                         email:auth.info.email,
	                         password:Devise.friendly_token[0,20]
	      )
	    end
	    user
  	end

  	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    	data = access_token.info
    	user = User.where(:email => data["email"]).first

    	unless user
      		user = User.create(name: data["name"],
                         	   email: data["email"],
                         	   password: Devise.friendly_token[0,20]
      		)
    	end
   	 	user
  end

  def self.find_for_vkontakte_oauth(access_token)
    if user = User.where(:email => (access_token.info.name.gsub(/\s+/, "").to_s + '@vk.com')).first
      user
    else 
      User.create!(name: access_token.info.name, 
                  :email => access_token.info.name.gsub(/\s+/, "").to_s + '@vk.com', 
                  :password => Devise.friendly_token[0,20]) 
    end
  end

   def self.find_for_twitter_oauth(auth)
      user = User.where(:provider => auth.provider, :uid => auth.uid).first
      unless user
          user = User.create(name:auth['info']['name'],
                               provider:auth.provider,
                             uid:auth.uid,
                             email:auth['info']['nickname']+"@example.org",
                             password:Devise.friendly_token[0,20]
          )
        end
      user
  end

  	def self.new_with_session(params, session)
    	super.tap do |user|
      		if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        		user.email = data["email"] if user.email.blank?
      		end
    	end
  	end

end
