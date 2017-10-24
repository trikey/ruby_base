class CargoTrain < Train

  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER
  
  def initialize(number, type = 'cargo')
    super
  end
end
