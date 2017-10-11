class FreightTrain < Train

  def initialize(number, type = "freight")
    super
  end

  def add_carriage(carriage)
    if carriage.is_a? FreightCarriage
      super(carriage)
    else
      puts "К этому поезду подсоединяются только грузовые вагоны"
    end
  end

end