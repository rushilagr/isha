namespace :import do
  desc "Importing data from csv's"

  # All import tasks share boiler-plate. DRY-ed that into a task-definer method.
  def define_task_and_with_file_input task_name
    # Define Task
    task task_name => :environment do |task, args|

      # Accept file path argument
      ARGV.each { |a| task a.to_sym do ; end }
      file_path = ARGV[1]

      yield file_path
    end
  end


  ## Import PinCodes
  define_task_and_with_file_input :pin_codes do |file_path|
    ImportPinCodesJob.perform_async file_path
    # ImportPinCodesJob.new.perform file_path
    # ImportPinCodesJob.new.perform file_path
  end

  ## Import participants
  define_task_and_with_file_input :participants do |file_path|
    ImportParticipantsJob.new.perform file_path
  end
end
