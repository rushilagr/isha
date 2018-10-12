class AdminController < ApplicationController
  def import_participants
    if request.post?
      file = params[:file]
      call_import_job_with_rescue_and_set_flash ImportParticipantsJob, file
      redirect_to admin_import_participants_path
    end
  end

  def import_pin_codes
    if request.post?
      file = params[:file]
      call_import_job_with_rescue_and_set_flash ImportPinCodesJob, file
      redirect_to admin_import_pin_codes_path
    end
  end

  private

  def call_import_job_with_rescue_and_set_flash job_class, file
    begin
      job_class.call file.path, true, current_user.phone
      flash[:notice] = 'The file is being processed. Youll get an SMS with the final status.'
    rescue StandardError => ex
      Raven.capture_exception(ex)
      flash[:alert] = "ERROR:<br> #{ex.message}"
    end
  end
end
