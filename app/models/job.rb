class Job < ApplicationRecord
  validates :title, :nature, :level,  :close_date, presence: true

  validate :close_date_cannot_be_in_the_past

  def close_date_cannot_be_in_the_past
    if close_date.present? && close_date <= Date.today
      errors.add(:close_date, "must be in the future")
    end
  end
end
