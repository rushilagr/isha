require 'faraday'

class HttpApi
  def self.request args
    ## Prepare connection object
    conn = Faraday.new(:url => args[:url]) do |faraday|
      # faraday.response :logger, ::Logger.new(STDOUT), bodies: true
      # faraday.use Faraday::Response::RaiseError
      faraday.authorization :Bearer, args[:bearer] unless args[:bearer].nil?
      faraday.request(:url_encoded) if args[:url_encoded] == true
      faraday.adapter Faraday.default_adapter
    end

    ## Make request
    response = conn.send(args[:method]) do |request|
      if args[:json] == true
        request.headers['Content-Type'] = 'application/json'
        args[:body] = args[:body].to_json
      end
      request.body = args[:body]
      request.params = args[:params] unless args[:params].nil?
    end

    ## Raise excpetion if response != 200
    if response.status != 200
      body = response.body.is_a?(Hash) ? response.body.except(:bearer) : response.body
      raise APIResponseNot200, "REQUEST: #{args} RESPONSE: #{{body: body, status: response.status}} \n "
    end

    ## Return response if all good
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
