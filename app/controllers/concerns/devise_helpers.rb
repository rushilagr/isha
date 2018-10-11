module DeviseHelpers
  extend ActiveSupport::Concern

  ## --------------------------------------------
  ## Devise after sign in & out paths
  ## --------------------------------------------

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
    resource.volunteer? ? consume_call_tasks_path : signed_in_root_path(resource)
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
