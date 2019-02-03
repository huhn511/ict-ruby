require "ict/version"

module Ict
  class Error < StandardError; end
  # Your code goes here...
  class Api

    require 'uri'
    require 'net/http'
    require 'net/https'
    require 'json'

    def initialize(settings = {})
      setSettings(settings)
    end

    def getConfig
      send_request("getConfig")
    end

    def setConfig(config_params)
      send_request("setConfig", config_params)
    end

    private

    def setSettings(settings)
      settings = symbolize_keys(settings)

      @url = settings[:url] || 'http://localhost:2187'
      @password = settings[:password] || 'test'
    end

    def symbolize_keys(hash)
      hash.inject({}){ |h,(k,v)| h[k.to_sym] = v; h }
    end

    def send_request(endpoint, data = {})

      url = URI.parse(@url + '/'+ endpoint)
      data["password"] = @password

      Net::HTTP.start(url.host, url.port) do |http|
        req = Net::HTTP::Post.new(url.path)
        req.body = URI.encode_www_form(data)

        res = http.request(req)
        return JSON.parse(res.body)
      end
    end

  end
end
