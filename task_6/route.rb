class Route
  include Validation
  attr_reader :stations, :number

  def initialize(number, start_station, end_station)
    @stations = [start_station, end_station ]
    @number = number
    validate!
    puts "Маршрут создан #{@stations.first.name} - #{@stations.last.name}"
  end

  def add_station(station)
    raise "Эта станция уже есть в маршруте!" unless @stations.include? station
    @stations.insert(-2, station) 
    puts "Станция добавлена"
  end

  def remove_station(station)
    raise "Первую и последнюю станции маршрута удалять нельзя!" if [@stations.first, @stations.last].include?(station)
    @stations.delete(station)
    puts "Станция удалена"
  end

  def show_stations
    puts "Маршрут: "
    @stations.each { |station| puts station.name }
  end
  
  private
  
    def validate!
      raise "Номер маршрута не может быть пустым, попробуйте еще раз." if @number.empty?
      raise "Не введены станции" if @stations.any? { |station| !station.nil? }
      raise "Некорректная начальная станция" if @stations.first.nil?
      raise "Некорректная конечная станция" if @stations.last.nil?
    end

end