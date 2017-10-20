class CargoCarriage < Carriage
  attr_reader :free

  def initialize(volume)
    @volume = volume
    @free = volume
    super
  end

  def type
    'cargo'
  end

  def fill(value)
    raise "Доступно #{@free_volume}, а вы пытаетесь добавить #{value}" if @free < value
    @free -= value
  end

  def taken
    @volume - @free
  end
end
