class Entry < ActiveRecord::Base
  validates :day, :uniqueness => true
  
  def self.get_week_for(day)
    if not day.monday?
      day = day.beginning_of_week
    end
    Entry.where("day > ? AND day < ?", (day-3.day), (day.end_of_week) )
  end
end
