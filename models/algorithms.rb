class Algorithms
  attr_reader :dfs

  def initialize
    @dfs = ->(robot) {
      robot.position.mark
      return if robot.position.is_end?
      robot.accessible_points.shuffle.each do |move|
        if move.point.is_unvisited?
          robot.position.direction = move.direction
          move.point.ancestor = robot.position
          robot.move_to move.point
          @dfs.call robot
          return if robot.position.is_end?
          robot.move_to move.point.ancestor
        end
      end
      robot.position.mark
    }
  end
end