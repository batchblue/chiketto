USER_ID = ENV['USER_ID'] || 11111
CONTACT_LIST_ID = ENV['CONTACT_LIST_ID'] || 22222

STUB_EVENT_ID = 99999
STUB_ORGANIZER_ID = 88888

STUB_USER = %{
  {
    "emails": [
        {
            "email": "foo@bar.com",
            "verified": false,
            "primary": true
        }
    ],
    "id": "#{USER_ID}",
    "name": "Foo Bar",
    "first_name": "Foo",
    "last_name": "Bar"
  }
}

STUB_USER_EVENTS = %{
  {
    "pagination": {
        "object_count": 1,
        "page_number": 1,
        "page_size": 50,
        "page_count": 1
    },
    "events": [
        {
            "resource_uri": "https://www.eventbriteapi.com/v3/events/#{STUB_EVENT_ID}/",
            "name": {
                "text": "Foo Event",
                "html": "Foo Event"
            },
            "description": {
                "text": "This is the first event that I am creating with this Eventbrite account. ",
                "html": "<P>This is the first event that I am creating with this Eventbrite account.<\/P>"
            },
            "id": "#{STUB_EVENT_ID}",
            "url": "http://www.eventbrite.com/e/foo-event-tickets-#{STUB_EVENT_ID}",
            "start": {
                "timezone": "America/Los_Angeles",
                "local": "2013-03-26T19:00:00",
                "utc": "2013-03-27T02:00:00Z"
            },
            "end": {
                "timezone": "America/Los_Angeles",
                "local": "2013-03-26T22:00:00",
                "utc": "2013-03-27T05:00:00Z"
            },
            "created": "2013-03-26T20:22:38Z",
            "changed": "2013-03-27T11:30:52Z",
            "capacity": 25,
            "status": "completed",
            "currency": "USD",
            "listed": false,
            "shareable": false,
            "invite_only": true,
            "online_event": false,
            "show_remaining": true,
            "tx_time_limit": 480,
            "logo_id": "1359755",
            "organizer_id": "#{STUB_ORGANIZER_ID}",
            "venue_id": null,
            "category_id": null,
            "subcategory_id": null,
            "format_id": null,
            "category": null,
            "subcategory": null,
            "format": null,
            "venue": null,
            "ticket_classes": [
                {
                    "resource_uri": "https://www.eventbriteapi.com/v3/events/#{STUB_EVENT_ID}/ticket_classes/15555/",
                    "id": "15555",
                    "name": "Free Tickets",
                    "description": null,
                    "donation": false,
                    "free": true,
                    "minimum_quantity": 1,
                    "maximum_quantity": null,
                    "maximum_quantity_per_order": 10,
                    "on_sale_status": "UNAVAILABLE",
                    "quantity_total": 25,
                    "quantity_sold": 15,
                    "sales_end": "2013-03-27T01:00:00Z",
                    "hidden": false,
                    "include_fee": false,
                    "split_fee": false,
                    "hide_description": true,
                    "auto_hide": false,
                    "variants": [],
                    "event_id": "#{STUB_EVENT_ID}"
                }
            ],
            "logo": {
                "id": "1359755",
                "url": "https://img.evbuc.com/http%3A%2F%2Fcdn.evbuc.com%2Fimages%2F1359755%2F56727857661%2F1%2Foriginal.jpg?h=200&w=450&s=39f0ce6e51534296248bb5d0e14f851b",
                "aspect_ratio": "1.3375"
            },
            "organizer": {
                "description": null,
                "logo": null,
                "resource_uri": "https://www.eventbriteapi.com/v3/organizers/#{STUB_ORGANIZER_ID}/",
                "id": "55555",
                "name": "Captain of Awesomeness",
                "url": "http://www.eventbrite.com/o/captain-of-awesomeness-#{STUB_ORGANIZER_ID}",
                "num_past_events": 0,
                "num_future_events": 0
            }
        }
    ]
  }
}

STUB_USER_ATTENDEES = %{
  {
    "pagination": {
        "object_count": 1,
        "page_number": 1,
        "page_size": 50,
        "page_count": 1
    },
    "attendees": [
      {
        "team": null,
        "resource_uri": "https://www.eventbriteapi.com/v3/events/#{STUB_EVENT_ID}/attendees/44444/",
        "id": "444444",
        "changed": "2013-03-26T20:37:09Z",
        "created": "2013-03-26T20:36:52Z",
        "quantity": 1,
        "profile": {
            "first_name": "Atendee",
            "last_name": "Test",
            "email": "attendee@test.com",
            "name": "Attendee Test",
            "addresses": {}
        },
        "barcodes": [
            {
                "status": "unused",
                "barcode": "155546735198407675001",
                "checkin_type": 0,
                "created": "2013-03-26T20:37:09Z",
                "changed": "2013-03-26T20:37:09Z"
            }
        ],
        "answers": [],
        "costs": {
            "payment_fee": {
                "currency": "USD",
                "display": "$0.00",
                "value": 0
            },
            "gross": {
                "currency": "USD",
                "display": "$0.00",
                "value": 0
            },
            "eventbrite_fee": {
                "currency": "USD",
                "display": "$0.00",
                "value": 0
            },
            "tax": {
                "currency": "USD",
                "display": "$0.00",
                "value": 0
            }
        },
        "checked_in": false,
        "cancelled": false,
        "refunded": false,
        "affiliate": "enivtefor001",
        "status": "Attending",
        "event_id": "#{STUB_EVENT_ID}",
        "order_id": "155546735",
        "ticket_class_id": "15555",
        "order": {
            "resource_uri": "https://www.eventbriteapi.com/v3/orders/155546735/",
            "id": "155546735",
            "changed": "2013-03-26T20:37:09Z",
            "created": "2013-03-26T20:36:52Z",
            "costs": {
                "payment_fee": {
                    "currency": "USD",
                    "display": "$0.00",
                    "value": 0
                },
                "gross": {
                    "currency": "USD",
                    "display": "$0.00",
                    "value": 0
                },
                "eventbrite_fee": {
                    "currency": "USD",
                    "display": "$0.00",
                    "value": 0
                },
                "tax": {
                    "currency": "USD",
                    "display": "$0.00",
                    "value": 0
                }
            },
            "name": "Leonard Blue",
            "first_name": "Leonard",
            "last_name": "Blue",
            "email": "lprue@batchblue.com",
            "status": "placed",
            "time_remaining": null,
            "event_id": "#{STUB_EVENT_ID}"
        },
        "event": {
            "resource_uri": "https://www.eventbriteapi.com/v3/events/#{STUB_EVENT_ID}/",
            "name": {
                "text": "Foo Event",
                "html": "Foo Event"
            },
            "description": {
                "text": "This is the first event that I am creating with this Eventbrite account. ",
                "html": "<P>This is the first event that I am creating with this Eventbrite account.<\/P>"
            },
            "id": "#{STUB_EVENT_ID}",
            "url": "http://www.eventbrite.com/e/foo-event-tickets-#{STUB_EVENT_ID}",
            "start": {
                "timezone": "America/Los_Angeles",
                "local": "2013-03-26T19:00:00",
                "utc": "2013-03-27T02:00:00Z"
            },
            "end": {
                "timezone": "America/Los_Angeles",
                "local": "2013-03-26T22:00:00",
                "utc": "2013-03-27T05:00:00Z"
            },
            "created": "2013-03-26T20:22:38Z",
            "changed": "2013-03-27T11:30:52Z",
            "capacity": 25,
            "status": "completed",
            "currency": "USD",
            "listed": false,
            "shareable": false,
            "invite_only": true,
            "online_event": false,
            "show_remaining": true,
            "tx_time_limit": 480,
            "logo_id": "1359755",
            "organizer_id": "#{STUB_ORGANIZER_ID}",
            "venue_id": null,
            "category_id": null,
            "subcategory_id": null,
            "format_id": null
        }
      }
    ]
  }
}

STUB_USER_ORGANIZERS = %{
  {
    "organizers": [
        {
            "description": null,
            "logo": null,
            "resource_uri": "https://www.eventbriteapi.com/v3/organizers/#{STUB_ORGANIZER_ID}/",
            "id": "#{STUB_ORGANIZER_ID}",
            "name": "Test Organizer",
            "url": "http://www.eventbrite.com/o/test-organizer-#{STUB_ORGANIZER_ID}",
            "num_past_events": 0,
            "num_future_events": 0
        }
    ],
    "pagination": {
        "object_count": 1,
        "page_number": 1,
        "page_size": 50,
        "page_count": 1
    }
  }
}

STUB_USER_CONTACT_LISTS = %{
  {
    "pagination": {
        "object_count": 10,
        "page_number": 1,
        "page_size": 50,
        "page_count": 1
    },
    "contact_lists": [
        {
            "resource_uri": "https://www.eventbriteapi.com/v3/users/#{USER_ID}/contact_lists/#{CONTACT_LIST_ID}/",
            "id": "#{CONTACT_LIST_ID}",
            "name": "Copy-First Test List",
            "user_id": "#{USER_ID}"
        }
    ]
  }
}

STUB_USER_CONTACT_LIST = %{
  {
    "resource_uri": "https://www.eventbriteapi.com/v3/users/#{USER_ID}/contact_lists/#{CONTACT_LIST_ID}/",
    "id": "#{CONTACT_LIST_ID}",
    "name": "Foo Test List",
    "user_id": "#{USER_ID}"
  }
}

def stub_users_me
  if stub_api_calls?
    stub_request(:get, %r{www.eventbriteapi.com/v3/users/me/}).to_return(body: STUB_USER)
  end
end

def stub_users_id
  if stub_api_calls?
    stub_request(:get, %r{www.eventbriteapi.com/v3/users/#{USER_ID}/}).to_return(body: STUB_USER)
  end
end

def stub_user_events
  if stub_api_calls?
    stub_request(:get, %r{www.eventbriteapi.com/v3/users/#{USER_ID}/owned_events/}).to_return(body: STUB_USER_EVENTS)
  end
end

def stub_user_attendees
  if stub_api_calls?
    stub_request(:get, %r{www.eventbriteapi.com/v3/users/#{USER_ID}/owned_event_attendees/}).to_return(body: STUB_USER_ATTENDEES)
  end
end

def stub_user_organizers
  if stub_api_calls?
    stub_request(:get, %r{www.eventbriteapi.com/v3/users/#{USER_ID}/organizers/}).to_return(body: STUB_USER_ORGANIZERS)
  end
end

def stub_user_contact_lists
  if stub_api_calls?
    stub_request(:get, %r{www.eventbriteapi.com/v3/users/#{USER_ID}/contact_lists/}).to_return(body: STUB_USER_CONTACT_LISTS)
  end
end

def stub_user_contact_list
  if stub_api_calls?
    stub_request(:get, %r{www.eventbriteapi.com/v3/users/#{USER_ID}/contact_lists/#{CONTACT_LIST_ID}/}).to_return(body: STUB_USER_CONTACT_LIST)
  end
end

def stub_user_create_contact_list
  if stub_api_calls?
    stub_request(:post, %r{www.eventbriteapi.com/v3/users/#{USER_ID}/contact_lists/}).to_return(body: STUB_USER_CONTACT_LIST)
  end
end
