require 'test_helper'

class OrderTest < MiniTest::Test
  ORDER_ID = 431012219

  def find_order
    VCR.use_cassette 'order-find' do
      Chiketto::Order.find ORDER_ID
    end
  end

  def test_exposes_data
    order = Chiketto::Order.new
    assert_respond_to order, :id
    assert_respond_to order, :name
    assert_respond_to order, :first_name
    assert_respond_to order, :last_name
    assert_respond_to order, :email
    assert_respond_to order, :costs
    assert_respond_to order, :status
    assert_respond_to order, :event_id
  end

  def test_attr_date_types
    order = Chiketto::Order.new created: "2014-02-11T02:52:10Z", changed: "2014-02-11T02:52:10Z"
    assert_kind_of DateTime, order.created
    assert_kind_of DateTime, order.changed
  end

  def test_order_find
    assert_kind_of Chiketto::Order, find_order
  end

  def test_order_has_event
    order = find_order
    assert_kind_of Chiketto::Event, order.event
  end

  def test_order_has_attendees
    order = find_order
    assert_kind_of Chiketto::Attendee, order.attendees.first
  end
end
