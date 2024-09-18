class Tweet < ApplicationRecord
    has_many :comments
    has_many :likes
    has_many :reposts

    belongs_to :user
end