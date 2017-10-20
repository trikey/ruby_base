module Validation
  def valid?
    validate!
    true
  rescue RuntimeError => e
    puts "Ошибка: #{e.message}"
    false
  end
end
