module CustomConstant

  module ConstantValue
    def const_values
      result = []
      constants.each { |constant_key| result << const_get(constant_key) }
      result
    end
  end

  DEMO = 100

end