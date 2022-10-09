# frozen_string_literal: true

require "rack"
require "rack/request"

module Rack
  class NakedToWww
    VERSION = "0.1.0"

    def initialize(app)
      @app = app
    end

    def call(env)
      if naked?(env)
        redirect_to_www(env)
      else
        @app.call(env)
      end
    end

    private

    def naked?(env)
      return false if env["HTTP_HOST"].nil?
      return false if /^localhost/.match?(env["HTTP_HOST"])

      env["HTTP_HOST"].split(".").length <= 2
    end

    def redirect_to_www(env)
      req = Request.new(env)

      url = URI(req.url)
      url.host = "www.#{url.host}"

      headers = {"Content-Type" => "text/html", "Location" => url.to_s}

      [302, headers, []]
    end
  end
end
