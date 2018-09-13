module SMS
  module_function

  def send_password name, phone, password
    msg =
"Namaskaram, #{name.capitalize}.

You have been added as a user to 'Isha Delhi Volunteers App'

Your password is #{password}

Don't share this with anyone.

Login at isha-ops.com/sign_in.

You can change your password later."

    send phone, msg
  end

  def send phone, msg
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
end
