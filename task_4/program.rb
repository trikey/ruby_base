require_relative 'station'
require_relative 'route'
require_relative 'train'

require_relative 'freight_train'
require_relative 'passenger_train'

require_relative 'carriage'
require_relative 'freight_carriage'
require_relative 'passenger_carriage'

stations = []
trains = []
routes = []
carriages_types = {'freight' => FreightCarriage, 'passenger' => PassengerCarriage}
trains_types = {'freight' => FreightTrain, 'passenger' => PassengerTrain}

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
9.  Ехать на следующую станцию
10. Ехать на предыдущую станцию
11. Просмотреть список станций маршрута
12. Просмотреть список поездов на станции
)
loop do
  print "Введите номер команды: "
  choice = gets.chomp.to_i
  case choice

  when 0 #Выход  
    break

  when 1 #Создать станцию
    puts "Введите название станции?"
    name = gets.chomp
    stations << Station.new(name)
    puts "Создана станция #{name}"

  when 2 #Создать поезд
    puts "Введите номер поезда"
    number = gets.chomp.to_i
    puts "Введите тип поезда. freight - грузовой, passenger - пассажирский"
    choice = gets.chomp
    if not trains_types[choice].nil?
      trains << trains_types[choice].new(number)
      puts "Поезд №#{number} создан"
    else 
      puts "Ошибка, попробуйте еще раз"
    end
    
  when 7 #Прицепить вагон к поезду
    puts "Введите номер поезда"
    number = gets.chomp.to_i
    train = trains.detect { |train| train.number == number }
    if train.nil?
      puts "Поезда с таким номером нет"
    else
      train.add_carriage(carriages_types[train.type].new)
    end

  when 8 #Отцепить вагон от поезда
    puts "Введите номер поезда"
    number = gets.chomp.to_i
    train = trains.detect { |train| train.number == number }
    if train.nil?
      puts "Поезда с таким номером нет"
    elsif train.carriages.empty?
      puts "Нечего отсоединять"
    else 
      train.remove_carriage(train.carriages.last)
    end

  else
    puts 'ooops'
    
  end
end