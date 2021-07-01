require_relative "lags/flight"

class Lags
  def initialize(flights)
    @flights = flights
  end

  def gain
    @flights.first.gain
  end
end
