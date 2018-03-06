require 'retriable'
require 'dry-configurable'

class Retry
  extend Dry::Configurable
  setting :api_retry_count, reader: true
  setting :logger

  def self.retry args={}
    args = {message: '', tries: config.api_retry_count}.merge args
    logger = config.logger || Logger.new(STDOUT)
      
    do_this_on_each_retry = Proc.new do |exception, try, elapsed_time, next_interval|
      logger.error args[:message].to_s + ". #{try} tries in #{elapsed_time} seconds and #{next_interval} seconds until the next try."
      # Raven.capture_exception(exception) 
    end

    Retriable.retriable on_retry: do_this_on_each_retry, tries: args[:tries] do
      yield
    end
  end
end