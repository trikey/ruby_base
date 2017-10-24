class Route
  include Validation
  attr_reader :stations, :number
  validate :number, :presence
  validate :stations, :presence
  validate :stations, :type, Array

  def initialize(number, start_station, end_station)
    @stations = [start_station, end_station]
    @number = number
    validate!
    puts "Маршрут создан #{@stations.first.name} - #{@stations.last.name}"
  end

  def add_station(station)
    raise 'Эта станция уже есть в маршруте!' unless @stations.include? station
    @stations.insert(-2, station)
    puts 'Станция добавлена'
  end

  def remove_station(station)
    raise 'Первую и последнюю станции удалять нельзя!' if [@stations.first, @stations.last].include?(station)
    @stations.delete(station)
    puts 'Станция удалена'
  end

  def show_stations
    puts 'Маршрут: '
    @stations.each { |station| puts station.name }
  end
end
