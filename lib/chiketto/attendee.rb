module Chiketto
  class Attendee < Resource
    attr_accessor :quantity,
                  :status,
                  :checked_in,
                  :costs,
                  :ticket_class_id,
                  :event_id,
                  :order_id,
                  :assigned_number,
                  :answers,
                  :barcodes,
                  :cancelled

    attr_date :changed,
              :created

    def profile
      AttendeeProfile.new @profile.to_h
    end

    def event
      Event.new @event.to_h
    end
  end
end
