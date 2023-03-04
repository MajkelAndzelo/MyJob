class Job < ApplicationRecord
    belongs_to :user
    before_save :set_posted_date
    validates_presence_of :title, :company, :location, :description, :posted_date, :expiration_date, :salary

    def set_posted_date
      self.posted_date = Time.current unless self.posted_date_changed?
    end
  end
  