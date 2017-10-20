class PassengerCarriage < Carriage
  attr_reader :free

  def initialize(seats)
    @seats = seats
    @free = seats
    super
  end

  def type
    'passenger'
  end

  def take_seat
    raise 'Не осталось свободных мест' if @free.zero?
    @free -= 1
  end

  def taken
    @seats - @free
  end
end
