module Enumerable 
  def invoke(method, *args) 
    map { |x| x.send method, *args } 
  end
  
  def pluck(key)
    map {|obj| obj[key] }
  end
end 