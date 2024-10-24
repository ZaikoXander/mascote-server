class Reservation < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true, format: { with: /\d{10,11}\z/, message: "must be a valid phone number" }
  validates :number_of_guests, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 9, message: "must be between 1 and 9 (9+)" }
  validates :date, presence: true
  validates :time, presence: true, format: { with: /\A([01]\d|2[0-3]):([0-5]\d)\z/, message: "must be in the format HH:MM" }
  validates :observations, allow_nil: true, length: { maximum: 500 }

  validate :unique_date_and_time

  private

  def unique_date_and_time
    if Reservation.exists?(date: date, time: time)
      errors.add(:base, "A reservation already exists for the same date and time")
    end
  end
end
