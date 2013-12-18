class Point
  attr_accessor :x, :y, :type, :marked, :direction, :ancestor
  attr_reader :height

  def initialize(x, y, type, height)
    @x = x
    @y = y
    @marked = 0
    @type = type
    @direction = nil
    @ancestor = nil
    @height = height
  end

  def mark
    @marked += 1
  end

  def is_start?
    @type == 's'
  end

  def is_end?
    @type == 'g'
  end

  def is_accessible?
    @type != 'w'
  end

  def is_unvisited?
    marked == 0
  end

  def is_marked_once?
    marked == 1
  end

  def is_marked_twice?
    marked == 2
  end

  def to_s
    if @type == 'w'
      "(#{@x +1}, #{@height - y}, #{@type}, #{@marked}, #{print_direction})".red
    elsif @marked == 1
      "(#{@x +1}, #{@height - y}, #{@type}, #{@marked}, #{print_direction})".green
    else
      "(#{@x +1}, #{@height - y}, #{@type}, #{@marked}, #{print_direction})"
    end
  end

  def to_coordinates
    "(#{@x +1}, #{@height - y})"
  end
  protected

  def print_direction
    case @direction
      when :up
        '^'
      when :right
        '>'
      when :down
        'd'
      when :left
        '<'
      else
        'n'
    end
  end

end

class AccessiblePoint < Point
  attr_accessor :direction

  def initialize(point, direction)
    super(point.x, point.y, point.type, point.height)
    @direction = direction
  end
end
