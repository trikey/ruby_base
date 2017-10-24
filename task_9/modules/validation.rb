module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :tests

    def validate(*args)
      args ||= []
      self.tests ||= []
      self.tests << args
    end
  end

  module InstanceMethods
    def validate!
      self.class.tests.each { |val| self.send val[1].to_sym, instance_variable_get("@#{val[0]}".to_sym), val[2] }
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
      raise 'Неверный класс!' if value.class != type
    end
  end
end