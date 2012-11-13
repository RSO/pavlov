module Pavlov
  module Validations
    def validate_hexadecimal_string param_name, param
      raise "#{param_name.to_s} should be an hexadecimal string." unless /\A[\da-fA-F]+\Z/.match param
    end

    def validate_regex param_name, param, regex, message
      raise "#{param_name.to_s} #{message}" unless regex.match param
    end

    def validate_integer param_name, param
      raise Pavlov::ValidationError, "#{param_name.to_s} should be a integer." unless param.is_a? Integer
    end

    def validate_in_set param_name, param, set
      raise Pavlov::ValidationError, "#{param_name.to_s} should be on of these values: #{set.inspect}." unless set.include? param
    end
  end
end
