class Object
  def send_chain(arg)
    if arg.is_a? Array
      arg.inject(self, :send)
    else
      self.send arg
    end
  end
end
