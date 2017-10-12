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
    )
    
    loop do
      print "Введите номер команды: "
      choice = gets.chomp.to_i
      case choice

      when 0 #Выход
        puts "Пока!"
        break

      when 1 #Создать станцию
        puts "Введите название станции?"
        name = gets.chomp
        @stations << Station.new(name)
        puts "Создана станция #{name}"

      when 2 #Создать поезд
        puts "Введите номер поезда"
        number = gets.chomp.to_i
        puts "Введите тип поезда. cargo - грузовой, passenger - пассажирский"
        choice = gets.chomp
        if not TRAINS_TYPES[choice].nil?
          @trains << TRAINS_TYPES[choice].new(number)
          puts "Поезд №#{number} создан"
        else 
          puts "Ошибка, попробуйте еще раз"
        end
        
      when 3 # Создать маршрут
        puts "Введите номер маршрута"
        number = gets.chomp.to_i
        start_station = find_station
        end_station = find_station
        @routes << Route.new(number, start_station, end_station) unless start_station.nil? or end_station.nil?        
      
      when 4 #Назначить маршрут поезду
        train = find_train
        route = find_route
        train.set_route(route) unless train.nil? or route.nil?
        
      when 5 #Добавить станцию к маршруту
        route = find_route
        station = find_station
        route.add_station(station) unless route.nil? or station.nil?
      
      when 6 #Удалить станцию из маршрута
        route = find_route
        station = find_station
        route.remove_station(station) unless route.nil? or station.nil?
        
      when 7 #Прицепить вагон к поезду
        train = find_train
        train.add_carriage(CARRIAGES_TYPES[train.type].new) unless train.nil?

      when 8 #Отцепить вагон от поезда
        train = find_train
        unless train.nil?
          if train.carriages.empty?
            puts "Нечего отсоединять"
          else
            train.remove_carriage(train.carriages.last)
          end
        end
        
      when 9 #Установить скорость поезду
        train = find_train
        unless train.nil?
          puts "Введите скорость"
          speed = gets.chomp.to_i
          train.speed = speed
          puts "Скорость поезда #{train.number} - #{train.speed}"
        end
        
      when 10 #Остановить поезд
        train = find_train
        train.stop unless train.nil?
        
      when 11 #Ехать на следующую станцию
        train = find_train
        train.move_forward unless train.nil? or train.route.nil?
        
      when 12 #Ехать на предыдущую станцию
        train = find_train
        train.move_back unless train.nil? or train.route.nil?
      
      when 13 #Просмотреть список станций маршрута
        route = find_route
        route.show_stations unless route.nil?
      
      when 14 #Просмотреть список поездов на станции
        station = find_station
        station.show_trains unless station.nil?
      end
    end
  end
  
  private
    ## 
    
    def find_train
      puts "Введите номер поезда"
      number = gets.chomp.to_i
      train = @trains.detect { |train| train.number == number }
      if train.nil?
        puts "Поезда с таким номером нет"
        return nil
      end
      return train
    end
      
    def find_station
      puts "Введите название станции"
      station_name = gets.chomp
      station = @stations.detect { |station| station.name == station_name }
      if station.nil?
        puts "Станции с таким названием нет"
        return nil
      end
      return station
    end
    
    def find_route
      puts "Введите номер маршрута"
      number = gets.chomp.to_i
      route = @routes.detect { |route| route.number == number }
      if route.nil?
        puts "Маршрута с таким номером нет"
        return nil
      end
      return route
    end
    
end