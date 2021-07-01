class Flight
  attr_reader :id, :start, :finish, :gain
  def initialize(manifest, delimeter = " ")
    @id, start, duration, gain = manifest.split(delimeter)
    @start = start.to_i
    @finish = @start + duration.to_i
    @gain = gain.to_i
  end
end
