require_relative "lags/flight"

class Lags
  def initialize(manifest)
    @manifest = manifest
  end

  def gain
    if non_intersecting?
      @manifest.inject(0) { |sum, flight| sum + flight.gain }
    else
      @manifest.map { |flight| [flight.gain, Lags.new(@manifest - [flight]).gain].max }.max
    end
  end

  def non_intersecting?
    @manifest.all? do |flight|
      (@manifest - [flight]).all? do |f|
        (flight.start + flight.duration) <= f.start || flight.start >= (f.start + f.duration)
      end
    end
  end
end
