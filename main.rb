require_relative 'board'
require_relative 'player'

# Controls the game play
class TicTacToe
  def initialize
    # set up the board
    @board = Board.new

    # set up the players
    @player_x = Player.new('Madam X', 'X', @board)
    @player_y = Player.new('Mister Y', 'O', @board)

    # get player names
    player_name?

    # assign the starting player
    @players = [@player_x, @player_y]
    @current_player = @players[rand(2)]
  end

  # play
  def play
    # loop infinitely
    loop do
      # call the Board rendering method
      puts "\e[H\e[2J"
      @board.render

      # ask coordinates from the current player
      @current_player.corodinates?

      # break the loop IF the game is over
      if check_game_over
        @board.render
        break
      end

      # switch players
      switch_players
    end
  end

  # check_game_over
  def check_game_over
    # check_victory
    # check_draw
    check_victory || check_draw
  end

  # check_victory?
  def check_victory
    # IF Board says current player's piece has
    # a winning_combination?
    if @board.winning_combination?(@current_player.piece)
      # display a victory message
      puts "Congratulations #{@current_player.name}, you win!"
      true
    else
      false
    end
  end

  # check_draw?
  def check_draw
    # IF Board says we've filled up
    if @board.full?
      # display a draw message
      puts 'Draw....'
      true
    else
      false
    end
  end

  # Get names of players
  def player_name?
    puts "Enter name of player 1 playing with 'X'"
    @player_x.name = gets.chomp

    puts "Enter name of player 2 playing with 'O'"
    @player_y.name = gets.chomp
  end

  # switch_players
  def switch_players
    @current_player = if @current_player == @player_x
                        @player_y
                      else
                        @player_x
                      end
  end
end

t = TicTacToe.new
t.play
