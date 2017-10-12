class Train
  attr_accessor :speed, :carriages
  attr_reader :current_station_index, :number, :type, :route

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @carriages = []
  end
  
  def stop
    @speed = 0
    puts "Поезд остановился"
  end
  
  def add_carriage(carriage)
    if @speed == 0 && carriage.type == self.type
      @carriages << carriage
      puts "К поезду под номером #{@number} подсоединен вагон, всего вагонов #{@carriages.length}"
    elsif carriage.type != train.type
      puts "Некорректный тип вагона"
    else
      puts "Невозможно прицепить вагон во время движения поезда!"
    end
  end
  
  def remove_carriage(carriage)
    if not @carriages.include?(carriage)
      puts "Вагона нет в поезде"
    elsif @speed == 0 && @carriages.length > 0
      @carriages.delete(carriage)
      puts "От поезда под номером #{@number} отсоединен вагон, всего вагонов #{@carriages.length}"
    elsif(@carriages.length == 0)
      puts "Нечего отцеплять"
    else
      puts "Невозможно отцепить вагон во время движения поезда!"
    end
  end
  
  def prev_station
    @route.stations[@current_station_index - 1]
  end
  
  def next_station
    @route.stations[@current_station_index + 1]
  end
  
  def current_station
    @route.stations[@current_station_index]
  end
      
  def move_forward
    if @speed > 0 && @current_station_index < @route.stations.index(@route.stations.last)
      self.current_station.remove_train(self)
      @current_station_index += 1
      self.current_station.add_train(self)
    else
      puts "Поезд на конечной станции"
    end
  end
  
  def move_back
    if @speed > 0 && @current_station_index > 0
      self.current_station.remove_train(self)
      @current_station_index -= 1
      self.current_station.add_train(self)
    else
      puts "Поезд на начальной станции"
    end
  end
  
  def set_route(route)
    @route = route
    @current_station_index = 0
    puts "Поезду #{@number} установлен новый маршрут следующий #{route.stations.first.name} - #{route.stations.last.name}"
  end
end