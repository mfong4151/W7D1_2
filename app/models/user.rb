# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord

    validates :username, uniqueness: true, presence: true
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true

    validates :password, length: 6, allow: nil

    attr_reader :password

    before_validation :ensure_session_token


    def self.find_by_credentials(username, password)
        user = User.find_by(username: params[:user][:username])
        if user && User.is_password?(params[:user][:password])
            redirect_to user_url
        else
            return false
        end
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(@password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def generate_unique_session_token
        token = SecureRandom::urlsafe_base64
        while User.exists?(session_token: token)
            token = SecureRandom::urlsafe_base64
        end
        token
    end

    def reset_session_token!
        session_token = generate_unique_session_token
        session_token.save!
        session_token
    end

    private

    def ensure_session_token

        session_token ||= reset_session_token

    end
end
