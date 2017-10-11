class PassengerTrain < Train
  
  def initialize(number, type = "passenger")
    super
  end

  def add_carriage(carriage)
    if carriage.is_a? PassengerCarriage
      super(carriage)
    else
      puts "К этому поезду подсоединяются только пассажирские вагоны"
    end 
  end

end