class AdminController < ApplicationController
  def import_participants
    if request.post?
      file = params[:file]
      ImportParticipantsJob.perform_async file.path
    end
  end

  def import_pin_codes
    if request.post?
      file = params[:file]
      ImportPinCodesJob.perform_async file.path
    end
  end
end
