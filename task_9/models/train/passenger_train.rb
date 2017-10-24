class PassengerTrain < Train

  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER
  
  def initialize(number, type = 'passenger')
    super
  end
end
