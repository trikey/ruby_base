class Train
  include Manufacturer
  include InstanceCounter
  include Validation
  attr_accessor :speed, :carriages
  attr_reader :current_station_index, :number, :type, :route
  @@trains = {}
  
  TRAIN_NUMBER = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i

  def self.find(number)
    @@trains[number]
  end
  
  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @carriages = []
    validate!
    @@trains[number] = self
    register_instance
  end
  
  def stop
    @speed = 0
    puts "Поезд остановился"
  end
  
  def add_carriage(carriage)
    raise "Невозможно прицепить вагон во время движения поезда!" unless @speed.zero? 
    raise "Некорректный тип вагона" if carriage.type != self.type
    @carriages << carriage
    puts "К поезду под номером #{@number} подсоединен вагон, всего вагонов #{@carriages.length}"
    rescue RuntimeError => e
      puts "Ошибка: #{e.message}" 
  end
  
  def remove_carriage(carriage)
    raise "Нечего отцеплять" if @carriages.length == 0
    raise "Вагона нет в поезде" if !@carriages.include?(carriage)
    raise "Невозможно отцепить вагон во время движения поезда!" unless @speed.zero? 
    @carriages.delete(carriage)
    puts "От поезда под номером #{@number} отсоединен вагон, всего вагонов #{@carriages.length}"
    rescue RuntimeError => e
      puts "Ошибка: #{e.message}" 
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
    raise "Не введен маршрут" if @route.nil?
    raise "Поезд на конечной станции" if @current_station_index == @route.stations.index(@route.stations.last)
    raise "Не установлена скорость поезда" if @speed.zero? 
    self.current_station.remove_train(self)
    @current_station_index += 1
    self.current_station.add_train(self)
    rescue RuntimeError => e
      puts "Ошибка: #{e.message}" 
  end
  
  def move_back
    raise "Не введен маршрут" if @route.nil?
    raise "Поезд на начальной станции" if @current_station_index == 0
    raise "Не установлена скорость поезда" if @speed.zero? 
    self.current_station.remove_train(self)
    @current_station_index -= 1
    self.current_station.add_train(self)
    rescue RuntimeError => e
      puts "Ошибка #{e.message}"
  end
  
  def set_route(route)
    @route = route
    @current_station_index = 0
    puts "Поезду #{@number} установлен новый маршрут следующий #{route.stations.first.name} - #{route.stations.last.name}"
  end
  
  private
    def validate!
      raise "Некорректный номер поезда" if @number !~ TRAIN_NUMBER
    end
end