# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  session_token   :string           not null
#  username        :string           not null
#
# Indexes
#
#  index_users_on_session_token  (session_token)
#  index_users_on_username       (username)
#

class User < ApplicationRecord 

    validates :session_token, :password_digest, presence: true
    validates :session_token, :username, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_nil: true

    has_many :characters

    after_initialize :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(user, password)     
        return nil unless user && user.is_password?(password)
        user
    end

    def self.find_by_email(email) 
        User.find_by(email: email)
    end


    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end


    private
    def ensure_session_token 
        self.session_token ||= User.generate_session_token
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end
end
