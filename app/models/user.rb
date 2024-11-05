class User < ApplicationRecord
    has_many :participations
    has_many :participated_events, through: :participations, source: :event
end
