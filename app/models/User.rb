class User < ApplicationRecord
    has many :tweets
    has many :reposts
end