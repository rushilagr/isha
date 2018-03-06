require 'faraday'

class Outbounds
  def self.request args
    conn = Faraday.new(:url => args[:url]) do |faraday|
      # faraday.response :logger, ::Logger.new(STDOUT), bodies: true
      # faraday.use Faraday::Response::RaiseError

      if args[:jwt] == true
        faraday.authorization :Bearer, JwtToken.token 
      elsif args[:jwt] != nil && args[:jwt] != false
        faraday.authorization :Bearer, args[:jwt]
      end
      faraday.adapter Faraday.default_adapter
    end

    response = conn.send(args[:method]) do |request|
      request.params = args[:params] unless args[:params].nil?
      if args[:json] == true
        request.headers['Content-Type'] = 'application/json'
        request.body = args[:body].to_json
      end
    end   

    if response.status != 200
      message = "REQUEST: #{args}        RESPONSE: #{response.inspect}"
      raise APIResponseNot200, message
    end 

    response
  end
end

class APIResponseNot200 < StandardError
  attr_accessor :object

  def initialize object=nil
    @object = object
    super(object)
  end
end