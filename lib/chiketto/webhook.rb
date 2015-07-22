module Chiketto
  class Webhook < Resource
    attr_accessor :endpoint_url,
                  :actions,
                  :user_id,
                  :event_id

    attr_date :created

    def delete
      response = Webhook.delete "webhooks/#{id}"
      response["success"]
    end

    def self.all(params = {})
      hooks = paginated(:webhooks, nil, params)
      hooks.map { |wh| Webhook.new wh }
    end

    def self.create(params)
      webhook = post 'webhooks', params
      Webhook.new webhook
    end

    private

    def self.find_webhooks(id, params)
      get 'webhooks', params
    end
  end
end
