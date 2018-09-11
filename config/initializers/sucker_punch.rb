if Rails.env.production?
  SuckerPunch.exception_handler = -> (ex, klass, args) { Raven.capture_exception(ex); puts ex }
else
  SuckerPunch.exception_handler = -> (ex, klass, args) { puts "#{ex.class}\n#{ex}"; puts ex.cause &.backtrace }
end
