class SudokuSolver
  def initialize
    @digits = '123456789'
    @rows = 'ABCDEFGHI'
    @cols = '123456789'
    @template = {}
    @input = {}
    @result = {}
    @rows.each_char do |row|
      @cols.each_char do |col|
        @template[row + col] = @digits
      end
    end
    @result = @template.clone
  end

  def set_grid(grid)
    index = 0
    @rows.each_char do |row|
      @cols.each_char do |col|
        @result[row + col] = grid[index]
        index += 1
      end
    end
    @input = @result.clone
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
sudoku = SudokuSolver.new
sudoku.set_grid(grid1)
sudoku.display
