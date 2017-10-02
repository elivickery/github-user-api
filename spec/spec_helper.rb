require 'rack/test'
require 'rspec'
require 'json'
require 'rack/test/body/json'

ENV['RACK_ENV'] = 'test'
ENV['ACCESS_TOKEN'] = '7c2432de2a737b5e40558332ed7e6507b3ca735b'

require File.expand_path '../../app/controllers/routes.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }
