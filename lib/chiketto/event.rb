module Chiketto
  class Event < Resource
    attr_reader :resource_uri,
                :url,
                :capacity,
                :status,
                :logo,
                :logo_url

    attr_attrib :description,
                :name

    attr_date :start,
              :end,
              :created,
              :changed

    def self.create(params)
      response = Event.post 'events', params
      Event.new response
    end

    def self.find(id, params = {})
      event = get "events/#{id}", params
      Event.new event
    end

    def self.search(params = {})
      events = get 'events/search', params
      events['events'].map { |event| Event.new event }
    end

    def attendees(params = {})
      attendees = Event.paginated_attendees @id, params
      attendees.map { |att| Attendee.new att }
    end

    def category
      Category.new @category.to_h
    end

    def listed?
      !!@listed
    end

    def questions
      questions = Event.find_questions id
      questions['questions'].map { |question| Question.new question }
    end

    def organizer
      Organizer.new @organizer.to_h
    end

    def subcategory
      Category.new @subcategory.to_h
    end

    def ticket_classes
      @ticket_classes.map do |t_class|
        TicketClass.new t_class.to_h
      end
    end

    def update(params)
      response = Event.post "events/#{@id}", params
      Event.new response
    end

    def venue
      Venue.new @venue.to_h
    end

    private

    def self.find_questions(id, params = {})
      get "events/#{id}/questions", params
    end

    def self.find_attendees(id, params = {})
      get "events/#{id}/attendees", params
    end

    def self.paginated_attendees(id, params)
      paginated(:attendees, id, params)
    end
  end
end
