module Accessors

  def attr_accessor_with_history(*args)
    args.each do |item|
      var_name = "@#{item}".to_sym
      define_method(item) { instance_variable_get(var_name) }
      define_method("#{item}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        @accessors_history ||= {}
        @accessors_history[item] ||= []
        @accessors_history[item] << value
      end
      define_method("#{item}_history") { @accessors_history ? @accessors_history[item] : [] }
    end
  end

  def strong_attr_accessor(name, v_class)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=") do |value|
      raise 'Ошибка! Несоответствие типа' unless value.is_a?(v_class)
      instance_variable_set(var_name, value)
    end
  end
end