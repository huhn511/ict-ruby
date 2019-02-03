require "ict/version"

module Ict
  class Error < StandardError; end
  # Your code goes here...
  class Api

    require 'uri'
    require 'net/http'
    require 'net/https'
    require 'json'

    def getConfig
      send_request("getConfig")
    end

    def send_request(endpoint)
      url = URI.parse("http://localhost:2187/#{endpoint}")
      data = {
        password: 'testtest'
      }
      Net::HTTP.start(url.host, url.port) do |http|
        req = Net::HTTP::Post.new(url.path)
        req.set_form_data(data)
        res = http.request(req)
        if res && res.kind_of?(Net::HTTPSuccess)
          return JSON.parse(res.body)
        else
          return "Something went wrong!"
        end
      end
    end

  end
end
