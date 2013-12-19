##
# This class defines maze solving algorithms

class Algorithms

  # Depth-first search (DFS) is an algorithm for traversing or searching tree or graph data structures.
  # One starts at the root (selecting some node as the root in the graph case)
  # and explores as far as possible along each branch before backtracking.
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