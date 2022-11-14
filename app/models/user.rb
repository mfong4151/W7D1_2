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
    



    def self.find_by_credentials(username, password)

    end

    def password=(password)
    
    end

    def is_password?(password)

    end 

    def generate_unique_session_token


    end

    def reset_session_token!

    end

    private

    def ensure_session_token

    end
end
