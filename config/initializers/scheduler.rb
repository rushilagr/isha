unless defined?(Rails::Console) || File.split($0).last == 'rake'
  s = Scheduler.scheduler

  s.cron ENV['SHEET_JOB_CRON'], name: 'Sheet Job' do
  end
end
