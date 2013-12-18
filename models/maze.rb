require_relative 'point'

class Maze
  attr_reader :grid, :start, :end

  def initialize(maze_file)
    @grid = []
    lines = []
    maze_file.each_line.with_index do |line|
      lines.push line.strip
    end
    start_counter = 0
    lines.each_with_index do |line, line_index|
      row = []
      letters = line.split(' ')
      letters.each_with_index do |letter, index|
        point = Point.new(index, line_index, letter, lines.length)
        if point.is_start?
          @start = point
          start_counter += 1
        end
        @end = point if point.is_end?
        row.push(point)
      end
      validate_line line
      @grid.push(row)
    end
    raise StartPointsArgumentError, 'There can and must be only one start point' if start_counter != 1
  end

  def validate_line(line)
    unless line =~ /\A(#{Point::TYPES[:free]} |#{Point::TYPES[:wall]} |#{Point::TYPES[:start]} |#{Point::TYPES[:end]} )*((#{Point::TYPES[:free]}|#{Point::TYPES[:wall]}|#{Point::TYPES[:start]}|#{Point::TYPES[:end]}))\z/
      raise LineFormatArgumentError, 'The format of line is incorrect. Check for spaces'
    end
  end

end

class LineFormatArgumentError < ArgumentError

end

class StartPointsArgumentError < ArgumentError

end
