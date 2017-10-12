class CargoTrain < Train

  def initialize(number, type = "cargo")
    super
  end

  def add_carriage(carriage)
    if carriage.is_a? CargoCarriage
      super(carriage)
    else
      puts "К этому поезду подсоединяются только грузовые вагоны"
    end
  end

end