require_relative 'string'

# Maintains game board state
class Board
  attr_accessor :size

  # Define the largest index FOR Board
  BOARD_MAX_INDEX = 2
  # Define what is considered an empty positon
  EMPTY_POS = ' '

  # initialize
  def initialize(size = 3)
    # set up blank data structure
    @board = Array.new(BOARD_MAX_INDEX + 1) { Array.new(BOARD_MAX_INDEX + 1) { EMPTY_POS } }
    @size = size
  end

  # render
  def render
    puts '+------+'
    # loop through data structure
    @board.each_with_index do |row_val, row|
      print '|'
      row_val.each_with_index do |_col_val, col|
        # display an existing marker any, else blank
        s = @board[row][col]
        if s == EMPTY_POS
          print col + (row * 3) + 1
        else
          print s.red
        end
        print '|'
      end
      puts "\n+------+"
    end
  end

  # add_piece
  def add_piece(coords, piece)
    # IF piece_location_valid?
    if piece_location_valid?(coords)
      # place piece
      @board[coords[0]][coords[1]] = piece
      true
    else
      false
    end
  end

  # piece_location_valid?
  def piece_location_valid?(coords)
    # Is the placement within_valid_coordinates?
    if within_valid_coordinates?(coords)
      # Are the piece coordinates_available?
      coordinates_available?(coords)
    end
  end

  # within_valid_coordinates?
  def within_valid_coordinates?(coords)
    # UNLESS piece coords are in the acceptable range
    row, col = coords.map(&:to_i)
    if row < @board.size && col < @board.size
      true
    else
      # display an error message
      puts 'Selection is out of bounds'
    end
  end

  # coordinates_available?
  def coordinates_available?(coords)
    # UNLESS piece coords are not occupied
    row, col = coords.map(&:to_i)
    if @board[row][col] == EMPTY_POS
      true
    else
      # display error message
      puts 'There is already a piece there!!'
    end
  end

  # winning_combination?
  def winning_combination?(piece)
    # is there a winning_diagonal?
    # is there a winning_vertical?
    # is there a winning_horizontal?
    winning_diagonal?(piece) ||
      winning_horizontal?(piece) ||
      winning_vertical?(piece)
  end

  # winning_diagonal?
  def winning_diagonal?(piece)
    # check specified piece has a triplet across diagonals
    diagonals.any? do |diag|
      diag.all? { |cell| cell == piece }
    end
  end

  # winning_vertical?
  def winning_vertical?(piece)
    # check specified piece has a triplet across verticals
    verticals.any? do |vert|
      vert.all? { |cell| cell == piece }
    end
  end

  # winning_horizontal?
  def winning_horizontal?(piece)
    # check specified piece has a triplet across horizontals
    horizontals.any? do |horz|
      horz.all? { |cell| cell == piece }
    end
  end

  # diagonals
  def diagonals
    # return the diagonal pieces
    [[@board[0][0], @board[1][1], @board[2][0]], [@board[2][0], @board[1][1], @board[0][2]]]
  end

  # verticals
  def verticals
    # return the vertical pieces
    horizontals = []
    3.times do |i|
      horizontals << [@board[0][i], @board[1][i], @board[2][i]]
    end
    horizontals
  end

  # horizontals
  def horizontals
    # return the horizontal pieces
    @board
  end

  # full?
  def full?
    # does every square contain a piece?
    @board.all? do |row|
      row.none?(EMPTY_POS)
    end
  end
end
