class LongRunningJob
  include SuckerPunch::Job

  ## Wrapper over perform_async/perform method calls.
  def self.start async, block, *args
    if async == true
      self.perform_async block, *args
    else
      self.new().perform block, *args
    end
  end

  ## Standard sucker_punch definition format
  def perform block, *args
    block.call *args
  end
end
