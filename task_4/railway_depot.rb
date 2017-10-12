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
    end
  
    def create_train
      puts "Введите номер поезда"
      number = gets.chomp.to_i
      puts "Введите тип поезда. cargo - грузовой, passenger - пассажирский"
      choice = gets.chomp
      if !TRAINS_TYPES[choice].nil?
        @trains << TRAINS_TYPES[choice].new(number)
        puts "Поезд №#{number} создан"
      else 
        puts "Ошибка, попробуйте еще раз"
      end
    end 
  
    def create_route
      puts "Введите номер маршрута"
      number = gets.chomp.to_i
      start_station = find_station
      end_station = find_station
      if start_station.nil? || end_station.nil?
        puts "Не удалось создать маршрут"
      else
        @routes << Route.new(number, start_station, end_station)
      end
    end
  
  
    def set_route_to_train
      train = find_train
      route = find_route
      train.set_route(route) unless train.nil? || route.nil?
    end
    
    def add_station_to_route
      route = find_route
      station = find_station
      route.add_station(station) unless route.nil? || station.nil?
    end
  
    def remove_station_from_route
      route = find_route
      station = find_station
      route.remove_station(station) unless route.nil? || station.nil?
    end
  
    def add_carraige_to_train
      train = find_train
      train.add_carriage(CARRIAGES_TYPES[train.type].new) unless train.nil?
    end
  
    def remove_carriage_from_train
      train = find_train
      unless train.nil?
        if train.carriages.empty?
          puts "Нечего отсоединять"
        else
          train.remove_carriage(train.carriages.last)
        end
      end
    end
  
    def set_train_speed
      train = find_train
      unless train.nil?
        puts "Введите скорость"
        speed = gets.chomp.to_i
        train.speed = speed
        puts "Скорость поезда #{train.number} - #{train.speed}"
      end
    end
  
    def stop_train
      train = find_train
      train.stop unless train.nil?
    end
    
    def move_train_forward
      train = find_train
      train.move_forward unless train.nil? || train.route.nil?
    end
  
    def move_train_back
      train = find_train
      train.move_back unless train.nil? || train.route.nil?
    end
  
    def show_route_stations
      route = find_route
      route.show_stations unless route.nil?
    end
    
    def show_trains_on_station
      station = find_station
      station.show_trains unless station.nil?
    end
  
    def show_stations
      @stations.each { |station| puts "#{station.name}" }
    end
    
    def show_trains
      @trains.each { |train| puts "Поезд №#{train.number}, тип #{train.type}" }
    end
    
    def show_routes
      @routes.each { |route| puts "Маршрут №#{route.number}, #{route.stations.first.name} - #{route.stations.last.name}" }
    end
    
    def find_train
      puts "Введите номер поезда"
      number = gets.chomp.to_i
      train = @trains.detect { |train| train.number == number }
      if train.nil?
        puts "Поезда с таким номером нет"
        return nil
      end
      train
    end
      
    def find_station
      puts "Введите название станции"
      station_name = gets.chomp
      station = @stations.detect { |station| station.name == station_name }
      if station.nil?
        puts "Станции с таким названием нет"
        return nil
      end
      station
    end
    
    def find_route
      puts "Введите номер маршрута"
      number = gets.chomp.to_i
      route = @routes.detect { |route| route.number == number }
      if route.nil?
        puts "Маршрута с таким номером нет"
        return nil
      end
      route
    end
    
end