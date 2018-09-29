require 'rufus-scheduler'

class Scheduler
  def self.init
    Rails.logger.info "Scheduler Initialized"
    scheduler = Rufus::Scheduler.new
    def scheduler.on_error job, error
      Rails.logger.error "JOB: #{job.opts[:name]} ERROR: #{error}"
      Raven.capture_exception(error)
    end
    def scheduler.on_pre_trigger(job, trigger_time)
      Rails.logger.info "CRON_JOB_STARTED: #{job.opts[:name]}"
    end
    def scheduler.on_post_trigger(job, trigger_time)
      Rails.logger.info "CRON_JOB_ENDED: #{job.opts[:name]}"
    end

    @@scheduler = scheduler
  end

  def self.scheduler
    Scheduler.init unless defined?(@@scheduler)
    @@scheduler
  end
end
