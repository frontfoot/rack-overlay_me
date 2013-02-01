require 'spec_helper'

describe Rack::OverlayMe::Middleware do
  it "should return the overlayme javascript on the path '/overlay_me.js" do
    app = lambda{ |env| [200, {"Content-Type" => 'text/html'}, ["<html><head></head><body><h1>Hello World</h1></body>"]]}
    middleware = Rack::OverlayMe::Middleware.new(app)
    status, headers, body = middleware.call("PATH_INFO" => '/overlay_me.js')
    body.should == File.read(File.expand_path('../../javascripts/overlay_me.js',__FILE__))
  end

  it "should append the javascript tag for overlayme javascript to the body" do
    app = lambda{ |env| [200, {"Content-Type" => 'text/html'}, ["<html><head></head><body><h1>Hello World</h1></body>"]]}
    middleware = Rack::OverlayMe::Middleware.new(app)
    status, headers, body = middleware.call({})    
    body.should == ["<html><head></head><body><h1>Hello World</h1><script type=\"text/javascript\" src=\"/overlay_me.js\"></script></body>"]
  end
end
