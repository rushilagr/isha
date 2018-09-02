unless defined?(Rails::Console) || File.split($0).last == 'rake'
  s = Scheduler.scheduler
end
