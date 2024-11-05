class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :stripe_customer_id, presence: true
end
