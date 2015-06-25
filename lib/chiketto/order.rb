module Chiketto
  class Order < Resource
    attr_accessor :name,
                  :first_name,
                  :last_name,
                  :email,
                  :costs,
                  :status,
                  :event_id

    attr_date :created,
              :changed

    def event
      Event.new @event.to_h
    end

    def attendees
      @attendees.map { |attendee| Attendee.new attendee }
    end

    def self.find(id, params = {})
      order = get "orders/#{id}", params
      Order.new order
    end
  end
end
