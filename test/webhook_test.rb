require 'test_helper'

class WebhookTest < MiniTest::Test
  def test_exposes_data
    webhook = Chiketto::Webhook.new
    assert_respond_to webhook, :id
    assert_respond_to webhook, :endpoint_url
    assert_respond_to webhook, :user_id
    assert_respond_to webhook, :event_id
    assert_respond_to webhook, :created
  end

  def test_attr_date_types
    webhook = Chiketto::Webhook.new created: "2014-02-11T02:52:10Z"
    assert_kind_of DateTime, webhook.created
  end

  def test_all
    VCR.use_cassette 'webhooks-all' do
      assert_kind_of Chiketto::Webhook, Chiketto::Webhook.all.first
    end
  end

  def test_create
    VCR.use_cassette 'webhooks-create' do
      webhook = Chiketto::Webhook.create 'endpoint_url' => 'http://requestb.in/y3jdgay3'
      assert_kind_of Chiketto::Webhook, webhook
    end
  end

  def test_delete
    webhook = Chiketto::Webhook.new id: 19185
    VCR.use_cassette 'webhooks-delete' do
      assert_kind_of TrueClass, webhook.delete
    end
  end
end
