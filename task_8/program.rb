require_relative 'modules/instance_counter'

require_relative 'modules/manufacturer'
require_relative 'modules/validation'

require_relative 'models/station'
require_relative 'models/route'
require_relative 'models/train/train'

require_relative 'models/train/cargo_train'
require_relative 'models/train/passenger_train'

require_relative 'models/carriage/carriage'
require_relative 'models/carriage/cargo_carriage'
require_relative 'models/carriage/passenger_carriage'

require_relative 'models/railway_depot'

depot = RailwayDepot.new
depot.start
