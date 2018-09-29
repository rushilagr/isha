require 'ostruct'

class FormObject < OpenStruct
  include ActiveModel::Model
  attr_writer :errors

  def self.from_hash hash
    obj = self.new
    hash.each {|key,value| obj.send("#{key}=", value)}
    obj
  end
end