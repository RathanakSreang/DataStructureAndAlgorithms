class SudokuSolver
  def initialize
    @digits = '123456789'
    @rows = 'ABCDEFGHI'
    @cols = '123456789'
    @template = {}
    @input = {}
    @result = {}
    @units = {}
    @peers = {}

    @rows.each_char do |row|
      @cols.each_char do |col|
        @template[row + col] = @digits
      end
    end
    # keys = []
    # @cols.each_char do |col|
    #   keys2 = []
    #   @rows.each_char do |row|
    #     keys2 << row + col
    #   end
    #   keys << keys2
    # end

    # @rows.each_char do |row|
    #   keys2 = []
    #   @cols.each_char do |col|
    #     keys2 << row + col
    #   end
    #   keys << keys2
    # end
    # puts "#{keys}"

    @result = @template.clone
  end

  # def cross(rows, cols)
  #   keys = []
  #   rows.each_char do |row|
  #     cols.each_char do |col|
  #       keys << row + col
  #     end
  #   end
  #   keys
  # end

  def set_grid(grid)
    index = 0
    @rows.each_char do |row|
      @cols.each_char do |col|
        @input[row + col] = grid[index]
        index += 1
      end
    end
    # @input = @result.clone
    @input.each do |key, value|
      if @digits.include?(value.to_s) && !assign(key,value)
        # return false
      end
    end
    true
  end

  def assign(key,value)
    other_values = @result[key] = @result[key].delete(value.to_s)
    res = []
    other_values.each_char do |d|
      res << eliminate(key, d)
    end
    res.all?
  end

  def eliminate(key, d)
    return false if !@result[key].include?(d.to_s)
    @result[key] = @result[key].delete(d.to_s)
    if @result[key].length == 0
      return false
    elsif @result[key].length == 1
      d2 = @result[key]
      res = []
      @peers[key].each do |key2|
        res << eliminate(key2, d2)
      end
      return res.all?
    end
    dplaces = []
    @units[key].each do |u|
      u.each do |u2|
        dplaces <<  u2 if @result[u2].include?(d)
      end
    end

    if dplaces.length == 0
      return false
    elsif dplaces.length == 1
      return assign(dplaces[0], d)
    end

    return @result
  end

  def max_length(sudoku_values)
    sudoku_values.values.map{|s| s.to_s.length}.max() + 1
  end

  def display_grid(sudoku_values)
    width = max_length(sudoku_values)
    line = (('-' * width * 3 + '+') * 3)[0..-2]
    text = ''

    @rows.each_char do |row|
      @cols.each_char do |col|
        text += sudoku_values[row + col].to_s.center(width)
        text += '36'.include?(col) ? "|" : ""
      end
      text += 'CF'.include?(row) ? "\n" + line + "\n" : "\n"
    end
    text
  end

  def display
    puts display_grid(@input)
    puts '-' * 30
    puts display_grid(@result)
  end
end

grid1 = '..3.2.6..9..3.5..1..18.64....81.29..7.......8..67.82....26.95..8..2.3..9..5.1.3..'
# hard1  = '.....6....59.....82....8....45........3........6..3.54...325..6..................'
sudoku = SudokuSolver.new
sudoku.set_grid(grid1)
sudoku.display
