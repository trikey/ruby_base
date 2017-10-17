class RailwayDepot
  CARRIAGES_TYPES = {'cargo' => CargoCarriage, 'passenger' => PassengerCarriage}
  TRAINS_TYPES = {'cargo' => CargoTrain, 'passenger' => PassengerTrain}
  
  def initialize
    @stations = []
    @trains = []
    @routes = []
  end
  
  def start_work
    puts %Q(
      0.  Выход
      1.  Создать станцию
      2.  Создать поезд
      3.  Создать маршрут
      4.  Назначить маршрут поезду
      5.  Добавить станцию к маршруту
      6.  Удалить станцию из маршрута
      7.  Прицепить вагон к поезду
      8.  Отцепить вагон от поезда
      9.  Задать скорость поезду
      10. Остановить поезд
      11. Ехать на следующую станцию
      12. Ехать на предыдущую станцию
      13. Просмотреть список станций маршрута
      14. Просмотреть список поездов на станции
      15. Просмотреть весь список станций
      16. Просмотреть весь список поездов
      17. Просмотреть весь список маршрутов
    )
    
    loop do
      print "Введите номер команды: "
      choice = gets.chomp.to_i
      case choice

        when 0 #Выход
          puts "Пока!"
          break

        when 1 #Создать станцию
          create_station

        when 2 #Создать поезд
          create_train
          
        when 3 # Создать маршрут
          create_route
        
        when 4 #Назначить маршрут поезду
          set_route_to_train
          
        when 5 #Добавить станцию к маршруту
          add_station_to_route
          
        when 6 #Удалить станцию из маршрута
          remove_station_from_route
          
        when 7 #Прицепить вагон к поезду
          add_carraige_to_train

        when 8 #Отцепить вагон от поезда
          remove_carriage_from_train
          
        when 9 #Установить скорость поезду
          set_train_speed
          
        when 10 #Остановить поезд
          stop_train
          
        when 11 #Ехать на следующую станцию
          move_train_forward
          
        when 12 #Ехать на предыдущую станцию
          move_train_back
        
        when 13 #Просмотреть список станций маршрута
          show_route_stations
        
        when 14 #Просмотреть список поездов на станции
          show_trains_on_station
        
        when 15 #Просмотреть весь список станций
          show_stations
          
        when 16 #Просмотреть весь список поездов
          show_trains
          
        when 17 #Просмотреть весь список маршрутов
          show_routes
      end
    end
  end
  
  private
  
    def create_station
      puts "Введите название станции?"
      name = gets.chomp
      @stations << Station.new(name)
      puts "Создана станция #{name}"
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
      retry
    end
  
    def create_train
      puts "Введите номер поезда"
      number = gets.chomp
      raise "Поезд № #{number} уже существует" unless Train.find(number).nil?
      
      puts "Введите тип поезда. cargo - грузовой, passenger - пассажирский"
      choice = gets.chomp
      raise "Поезд не создан. Введен несуществующий тип поезда" unless ['cargo', 'passenger'].include?(choice)
      
      @trains << TRAINS_TYPES[choice].new(number)
      puts "Поезд №#{number} создан"
      
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
      retry      
    end 
  
    def create_route
      puts "Введите номер маршрута"
      number = gets.chomp
      start_station = find_station
      raise "Станции с таким названием нет" if start_station.nil?
      end_station = find_station
      raise "Станции с таким названием нет" if end_station.nil?
      raise "Не удалось создать маршрут" if start_station.nil? || end_station.nil?
      @routes << Route.new(number, start_station, end_station)
      
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
  
  
    def set_route_to_train
      train = find_train
      raise "Поезда с таким номером нет" if train.nil?
      route = find_route
      raise "Маршрута с таким номером нет" if route.nil?
      train.set_route(route)
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
    
    def add_station_to_route
      route = find_route
      raise "Маршрута с таким номером нет" if route.nil?
      station = find_station
      raise "Станции с таким названием нет" if station.nil?
      route.add_station(station)
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
  
    def remove_station_from_route
      route = find_route
      raise "Маршрута с таким номером нет" if route.nil?
      station = find_station
      raise "Станции с таким названием нет" if station.nil?
      route.remove_station(station)
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
  
    def add_carraige_to_train
      train = find_train
      raise "Поезда с таким номером нет" if train.nil?
      train.add_carriage(CARRIAGES_TYPES[train.type].new)
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
  
    def remove_carriage_from_train
      train = find_train
      raise "Поезда с таким номером нет" if train.nil?
      train.remove_carriage(train.carriages.last)
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
  
    def set_train_speed
      train = find_train
      raise "Поезда с таким номером нет" if train.nil?
      puts "Введите скорость"
      speed = gets.chomp.to_i
      train.speed = speed
      puts "Скорость поезда #{train.number} - #{train.speed}"
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
  
    def stop_train
      train = find_train
      raise "Поезда с таким номером нет" if train.nil?
      train.stop
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
    
    def move_train_forward
      train = find_train
      raise "Поезда с таким номером нет" if train.nil?
      train.move_forward
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
  
    def move_train_back
      train = find_train
      raise "Поезда с таким номером нет" if train.nil?
      train.move_back
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
  
    def show_route_stations
      route = find_route
      raise "Маршрута с таким номером нет" if route.nil?
      route.show_stations
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
    
    def show_trains_on_station
      station = find_station
      raise "Станции с таким названием нет" if station.nil?
      station.show_trains
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
  
    def show_stations
      raise "Не создано ни одной станции" if !@stations.any?
      @stations.each { |station| puts "#{station.name}" }
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
    
    def show_trains
      raise "Не создано ни одного поезда" if !@trains.any?
      @trains.each { |train| puts "Поезд №#{train.number}, тип #{train.type}" }
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
    
    def show_routes
      raise "Не создано ни одного маршрута" if !@routes.any?
      @routes.each { |route| puts "Маршрут №#{route.number}, #{route.stations.first.name} - #{route.stations.last.name}" }
      rescue RuntimeError => e
        puts "Ошибка: #{e.message}"
    end
    
    def find_train
      puts "Введите номер поезда"
      number = gets.chomp
      train = @trains.detect { |train| train.number == number }
      train
    end
      
    def find_station
      puts "Введите название станции"
      station_name = gets.chomp
      station = @stations.detect { |station| station.name == station_name }
      station
    end
    
    def find_route
      puts "Введите номер маршрута"
      number = gets.chomp
      route = @routes.detect { |route| route.number == number }
      route
    end
    
end