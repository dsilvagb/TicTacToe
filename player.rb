require_relative 'board'

# Manages all player-related functionality
class Player
  attr_accessor :name, :piece

  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  # get_corodinates
  def corodinates?
    # loop infinitely
    loop do
      # ask_for_coordinates
      coords = ask_for_coordinates
      # IF valid_coordinates_format is true
      if valid_coordinates_format(coords) && @board.add_piece(coords, @piece)
        # break the loop
        break
      end
    end
  end

  # ask_for_coordinates
  def ask_for_coordinates
    # Display message asking coordinates
    puts "#{@name}(#{@piece}), enter your selection"
    # pull coordinates from command line
    loop do
      move = gets.to_i - 1
      if move >= 0
        col = move % @board.size
        row = (move - col) / @board.size
        return [row, col]
      else
        puts 'Please enter a valid selection'
      end
    end
  end

  # valid_coordinates_format
  def valid_coordinates_format(coords)
    # UNLESS coordinates are in proper format
    if coords.is_a?(Array) && coords.size == 2
      true
    else
      # display error message
      puts 'Your format is not correct!!'
    end
  end
end
