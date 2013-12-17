class Move
  attr_reader :point, :direction

  def initialize(point, direction)
    @point = point
    @direction = direction
  end
end