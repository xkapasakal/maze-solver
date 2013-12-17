class Robot
  attr_reader :maze
  attr_reader :position

  def initialize(maze)
    @maze = maze
    move_to(maze.start)
  end

  def move_dfs  (algorithm)
    algorithm.call self
  end

  # adjacency-matrix
  def accessible_points
    accessible_points = []
    accessible_points.push(up_point) if up_point and up_point.is_accessible?
    accessible_points.push(right_point) if right_point and right_point.is_accessible?
    accessible_points.push(down_point) if down_point and down_point.is_accessible?
    accessible_points.push(left_point) if left_point and left_point.is_accessible?
    accessible_points
  end

  def move_to(point)
    @position = point
    puts @position.to_s
    #@position.mark
  end

  private
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