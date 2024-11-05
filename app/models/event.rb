class Event < ApplicationRecord
    has_many :participations
    has_many :participants, through: :participations, source: :user

  # Validations
  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past

  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :duration_must_be_multiple_of_five

  validates :title, presence: true, length: { minimum: 5, maximum: 140 }

  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }

  validates :location, presence: true

  private

  # Validation method to check that start_date is not in the past
  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Time.now
      errors.add(:start_date, "can't be in the past")
    end
  end

  # Validation method to check that duration is a multiple of 5
  def duration_must_be_multiple_of_five
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "must be a multiple of 5")
    end
  end
end
