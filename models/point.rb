class Point

  TYPES = { free: 'f', wall: 'w', start: 's', end: 'g' }

  attr_accessor :x, :y, :type, :marked, :direction, :ancestor
  attr_reader :height

  ##
  # Creates a new point where
  # +x+ is the horizontal coordinate starting from 0,
  # +y+ is the vertical coordinate starting from 0,
  # +type+ is the type of point (one of 'f', 'w', 's' or 'g')
  # and +height+ is the number of rows.
  #
  #
  # A PointTypeArgumentError is raised if the type id not one of 'f', 'w', 's' or 'g'

  def initialize(x, y, type, height)
    @x = x
    @y = y
    @marked = 0
    @type = type
    @direction = nil
    @ancestor = nil
    @height = height
    validate
  end

  def mark
    @marked += 1
  end

  def is_start?
    @type == TYPES[:start]
  end

  def is_end?
    @type == TYPES[:end]
  end

  def is_accessible?
    @type != TYPES[:wall]
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
    if @type == TYPES[:wall]
      "(#{@x +1}, #{@height - y}, #{@type}, #{@marked}, #{print_direction})".red
    elsif is_start?
      "(#{@x +1}, #{@height - y}, #{@type}, #{@marked}, #{print_direction})".blue
    elsif is_end?
      "(#{@x +1}, #{@height - y}, #{@type}, #{@marked}, #{print_direction})".yellow
    elsif is_marked_once?
      "(#{@x +1}, #{@height - y}, #{@type}, #{@marked}, #{print_direction})".green
    elsif is_marked_twice?
      "(#{@x +1}, #{@height - y}, #{@type}, #{@marked}, #{print_direction})".magenta
    else
      "(#{@x +1}, #{@height - y}, #{@type}, #{@marked}, #{print_direction})"
    end
  end

  def validate
    validate_type
  end

  def to_coordinates
    "(#{@x +1}, #{@height - y})"
  end
  protected

  def validate_type
    unless @type =~ /(#{TYPES[:free]}|#{TYPES[:wall]}|#{TYPES[:start]}|#{TYPES[:end]})/
      raise PointTypeArgumentError, "the letter '#{@type}' is not valid for point type. Use one of '#{TYPES[:free]}' for free,
        '#{TYPES[:wall]}' for wall, '#{TYPES[:start]}' for start and #{TYPES[:end]} for end"
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
    super(point.x, point.y, point.type, point.height)
    @direction = direction
  end
end

class PointTypeArgumentError < ArgumentError
end
