class User < ApplicationRecord
    has_many :tweets, dependent: :destroy
    has_many :reposts  
end