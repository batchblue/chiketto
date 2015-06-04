require 'test_helper'

class ContactTest < MiniTest::Test
  def test_exposes_data
    contact = Chiketto::Contact.new
    assert_respond_to contact, :first_name
    assert_respond_to contact, :last_name
    assert_respond_to contact, :email
    assert_respond_to contact, :created
  end

  def test_attr_date_types
    contact = Chiketto::Contact.new created: "2014-02-11T02:52:10Z"
    assert_kind_of DateTime, contact.created
  end
end
