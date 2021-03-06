module SMS
  module_function

  def send_password name, phone, password, assigner_name, assigner_phone
    msg =
"Namaskaram, #{name.capitalize}.

You have been added as a user to 'Isha Delhi Volunteers App'

Your password is #{password}

Don't share this with anyone.

Login at #{self.login_url}.
You can change your password later.

For doubts, please contact #{assigner_name} at #{assigner_phone}
"

    send(phone, msg)
  end

  def send_call_task_to_caller name, phone, call_task_name, assigner_name, assigner_phone
    msg =
"Namaskaram, #{name.capitalize}.

You have been assigned to calling task '#{call_task_name}'

Login at #{self.login_url} and look for the instructions there.

For doubts, please contact #{assigner_name} at #{assigner_phone}"

    send(phone, msg)
  end

  def send_password_reset token, user_id, name, phone
    link = Rails.application.routes.url_helpers.edit_user_password_url(user_id, reset_password_token: token)
    msg =
"Namaskaram, #{name.capitalize}.

Click on the link below to reset your password
#{link}"

    send(phone, msg)
  end

  def send_import_job_error ex_with_context, caller_phone
    caller_msg =
"Import Job failed.
Call admin.
Error: #{ex_with_context.inspect}"
    send caller_phone, caller_msg

    admin_msg =
"Import Job failed.
Called by: #{caller_phone}
Error: #{ex_with_context.inspect}"
    User.admin.each do |user|
      send user.phone, admin_msg
    end
  end

  def send_import_job_success caller_phone
    msg = "Import Job success."
    send caller_phone, msg
  end

  def send_sms_to_call_task_participant caller_phone, msg
    send caller_phone, msg
  end

  def send phone, msg
    if !Rails.env.production?
      Rails.logger.info 'SMS start ---------------------------------------------'
      Rails.logger.info msg
      Rails.logger.info 'SMS end -----------------------------------------------'
      return true
    end

    response = HttpApi.request({
      url: 'http://www.myvaluefirst.com/smpp/sendsms',
      method: 'get',
      params: {
        username: 'ishainsthttp',
        password: 'ishains5',
        to: phone,
        from: 'ISHADL',
        text: msg
      }
    })

    response.body == 'Sent.' ? true : false
  end

  def login_url
    Rails.application.routes.url_helpers.new_user_session_url
  end
end
