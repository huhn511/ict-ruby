require "ict/version"

module Ict
  class Error < StandardError; end
  # Your code goes here...
  class Api

    require 'uri'
    require 'net/http'
    require 'net/https'

    def getConfig

      uri = URI.parse("http://localhost:8000/getConfig")
      https = Net::HTTP.new(uri.host,uri.port)
      req = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
      res = https.request(req)
      pp "response"
      pp res
    end
  end
end
