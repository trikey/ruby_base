module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(*args)
      args ||= []
      self.validations ||= []
      self.validations << { 'variable': args[0], 'method': args[1], 'options': args[2] }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each { |val| self.send val[:method].to_sym, instance_variable_get("@#{val[:variable]}".to_sym), val[:options] }
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    private

    def presence(value, _options)
      raise 'Пустое значение недопустимо!' if value.empty?
    end

    def format(value, format)
      raise 'Неверный формат!' if value !~ format
    end

    def type(value, type)
      raise 'Неверный класс!' if value.is_a? type
    end
  end
end