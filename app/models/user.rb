class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :participations
    has_many :participated_events, through: :participations, source: :event

    after_create :welcome_send

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
end
