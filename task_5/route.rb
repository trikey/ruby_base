class Route
  attr_reader :stations, :number

  def initialize(number, start_station, end_station)
    @stations = [start_station, end_station ]
    @number = number
    puts "Маршрут создан #{@stations.first.name} - #{@stations.last.name}"
  end

  def add_station(station)
    unless @stations.include? station
      @stations.insert(-2, station) 
      puts "Станция добавлена"
    end
  end

  def remove_station(station)
    unless [@stations.first, @stations.last].include? station
      @stations.delete(station)
      puts "Станция удалена"
    end
  end

  def show_stations
    puts "Маршрут: "
    @stations.each { |station| puts station.name }
  end

end