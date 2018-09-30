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
    'http://isha-ops.org'
  end
end
