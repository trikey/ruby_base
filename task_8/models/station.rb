class Station
  include InstanceCounter
  include Validation
  attr_reader :trains, :name
  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def add_train(train)
    raise "Поезд №#{train.number} уже на станции #{name}" if @trains.include?(train)
    @trains << train
    puts "На станцию #{@name} прибыл #{train.type} поезд под номером #{train.number}"
  end

  def remove_train(train)
    @trains.delete(train)
    puts "Со станции #{@name} отбыл #{train.type} поезд под номером #{train.number}"
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def iterate_trains
    raise 'Вы не передали блок' unless block_given?
    raise 'На станции нет поездов' if @trains.empty?
    @trains.each { |train| yield(train) }
  end

  private

  def validate!
    raise 'Название станции не может быть пустым, попробуйте еще раз.' if @name.empty?
  end
end
