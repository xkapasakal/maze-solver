class Robot
  attr_reader :maze
  attr_accessor :position

  def initialize(maze)
    @maze = maze
    move_to(maze.start)
  end

  def move_up
    move_to up_point
  end

  def move_right
    move_to right_point
  end

  def move_down
    move_to down_point
  end

  def move_left
    move_to left_point
  end

  # In the beginning a random direction is chosen (if there is more than one).
  # On arriving at a junction that has not been visited before (no other marks),
  # pick a random direction (and mark the path).
  # When arriving at a marked junction and if your current path is marked only once
  # then turn around and walk back (and mark the path a second time).
  # If this is not the case, pick the direction with the fewest marks (and mark it, as always).
  # When you finally reach the solution, paths marked exactly once will indicate a direct way
  # back to the start.
  # If there is no exit, this method will take you back to the start where all paths are marked twice.
  # In this case each path is walked down exactly twice, once in each direction.
  # The resulting walk is called a bidirectional double-tracing
  def move
    until @position.is_end?
      unvisited_point = accessible_points.shuffle.select {|point| point.is_unvisited?}.first
      if unvisited_point
        @position.direction = unvisited_point.direction
        move_to unvisited_point
      else
        # all points are marked once or twice
        if @position.is_marked_once?
          @position.mark
          point = accessible_points.find {|point| point.direction == @position.opposite_direction}
          @position.direction = point.direction
          move_to point
        else
          point = accessible_points.shuffle.sort {|point| point.marked}.first
          @position.direction = point.direction
          move_to point
        end
      end
    end
  end

  private
  def move_to(point)
    ap @position.to_descr if @position
    @position = point
    @position.mark
  end

  def accessible_points
    accessible_points = []
    accessible_points.push(up_point) if up_point and up_point.is_accessible?
    accessible_points.push(right_point) if right_point and right_point.is_accessible?
    accessible_points.push(down_point) if down_point and down_point.is_accessible?
    accessible_points.push(left_point) if left_point and left_point.is_accessible?
    accessible_points
  end

  def up_point
    if @maze.grid[@position.y - 1] and @position.y - 1 >= 0
      point = @maze.grid[@position.y - 1][@position.x]
      point.direction = :up
      point
    end
  end

  def right_point
    if @maze.grid[@position.y][@position.x + 1]
      point = @maze.grid[@position.y][@position.x + 1]
      point.direction = :right
      point
    end
  end

  def down_point
    if @maze.grid[@position.y + 1]
      point = @maze.grid[@position.y + 1][@position.x]
      point.direction = :down
      point
    end
  end

  def left_point
    if @position.x - 1 >= 0 and @maze.grid[@position.y][@position.x - 1]
      point = @maze.grid[@position.y][@position.x - 1]
      point.direction = :left
      point
    end
  end

end