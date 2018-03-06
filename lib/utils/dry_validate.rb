require 'dry-validation'

class DryValidate
  def self.[](schema, params)
    params = params.to_unsafe_hash if params.class.to_s == 'ActionController::Parameters'

    obj = schema.call params
    if obj.success?
      obj.output
    else
      raise ValidationError.new params.merge(errors: obj.errors)
    end
  end
end

class ValidationError < StandardError
  attr_accessor :params

  def initialize params=nil
    @params = params
    super(params)
  end
end