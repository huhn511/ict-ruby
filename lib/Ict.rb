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

    private

    def setSettings(settings)
      settings = symbolize_keys(settings)

      @url = settings[:url] || 'http://localhost:2187'
      @password = settings[:password] || 'test'
    end

    def symbolize_keys(hash)
      hash.inject({}){ |h,(k,v)| h[k.to_sym] = v; h }
    end

    def send_request(endpoint)
      url = URI.parse(@url + '/'+ endpoint)
      data = {
        password: @password
      }
      Net::HTTP.start(url.host, url.port) do |http|
        req = Net::HTTP::Post.new(url.path)
        req.set_form_data(data)
        res = http.request(req)
        if res && res.kind_of?(Net::HTTPSuccess)
          return JSON.parse(res.body)
        else
          return false
        end
      end
    end

  end
end
