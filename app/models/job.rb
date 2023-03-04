class Job < ApplicationRecord
    before_save :set_posted_date
  
    def set_posted_date
        self.posted_date = Time.current unless self.posted_date_changed?
      end
      
  end
  