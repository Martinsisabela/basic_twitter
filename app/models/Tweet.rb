class Tweet < ApplicationRecord
    has_many :comments
    has_many :likes, dependent: :destroy
    has_many :reposts, dependent: :destroy

    belongs_to :user
end