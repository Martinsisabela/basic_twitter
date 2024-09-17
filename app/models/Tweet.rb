class Tweet < ApplicationRecord
    has many :comments
    has many :likes
    has many :reposts

    belongs_to :user
end