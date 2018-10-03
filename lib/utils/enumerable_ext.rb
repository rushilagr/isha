module Enumerable
  def invoke(method, *args)
    map { |x| x.send method, *args }
  end

  def pluck(key)
    map {|obj| obj[key] }
  end

  def find_element_after(element)
    index = find_index(element) + 1
    at(index % size)
  end
end
