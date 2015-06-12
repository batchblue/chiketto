require 'chiketto'
require 'dotenv'
require 'minitest/autorun'
require 'webmock/minitest'

Dotenv.load

require 'vcr'
VCR.configure do |c|
  c.cassette_library_dir = 'test/vcr'
  c.hook_into :webmock
end

def stub_api_calls?
  ENV['LIVE_API_CALLS'] != "true"
end

require 'mocks/user_mocks'
