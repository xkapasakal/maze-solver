class Point
  attr_accessor :x, :y, :type, :marked, :direction, :ancestor
  def initialize(x, y, type)
    @x = x
    @y = y
    @marked = 0
    @type = type
    @direction = nil
    @ancestor = nil
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

  def opposite_direction
    case @direction
      when :up
        :down
      when :right
        :left
      when :down
        :up
      when :left
        :right
      else
        puts "You gave me #{@direction} -- I have no idea what to do with that."
    end
  end

  def to_s
    if @type == 'w'
      "(#{@x}, #{y}, #{@type}, #{@marked}, #{print_direction})".red
    elsif @marked == 1
      "(#{@x}, #{y}, #{@type}, #{@marked}, #{print_direction})".green
    else
      "(#{@x}, #{y}, #{@type}, #{@marked}, #{print_direction})"
    end
  end

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
    super(point.x, point.y, point.type)
    @direction = direction
  end
end
