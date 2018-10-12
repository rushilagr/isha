if Rails.env.production?
  SuckerPunch.exception_handler = -> (ex, klass, args) { Raven.capture_exception(ex); Rails.logger.info ex }
else
  SuckerPunch.exception_handler = -> (ex, klass, args) { Rails.logger.info "#{ex.class}\n#{ex}"; Rails.logger.info ex.cause &.backtrace }
end
