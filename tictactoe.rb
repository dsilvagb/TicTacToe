class TicTacToe
  # initialize
    # set up the board
    # set up the players
    # assign the starting playerign the starting player

  # play
    # loop infinitely
      # call the Board rendering method
      # ask for coordinates from the current player
      # break the loop IF the game is over
      # switch players

  # check_game_over
    # check_victory
    # check_draw
  
  # check_victory
    # IF Board says current player's piece has 
    # a winning_combination?
      # display a victory message

  # check_draw
    # IF Board says we've filled up
      # display a draw message

  # switch_players
    # PlayerX >> PlayerO or vice versa

end

class Player
  # initalize
    # Set marker type (e.g. X or O)

  # get_corodinates
    # loop infinitely
      # ask_for_coordinates
      # IF valid_coordinates_format is true
        # IF piece can be placed on Board
          # break the loop
          
  # ask_for_coordinates
    # Display message asking for coordinates
    # pull coordinates from command line

  # valid_coordinates_format
    # UNLESS coordinates are in proper format
      # display error message

end

class Board
  # initialize
    # set up blank data structure

  # render
    # loop through data structure
      # display an existing marker if any, else blank 

  # add_piece
    # IF piece_location_valid?
      # place piece
    # ELSE
      # display error message

  # piece_location_valid?
    # Is the placement within_valid_coordinates?
    # Are the piece coordinates_available?

  # within_valid_coordinates?
    # UNLESS piece coords are in the acceptable range
      # display an error message

  # coordinates_available?
    # UNLESS piece coords are not occupied
      # display error message

  # winning_combination?
    # is there a winning_diagonal?
    # is there a winning_vertical?
    # is there a winning_horizontal? for that piece?

  # winning_diagonal?
    # check if specified piece has a triplet across diagonals

  # winning_vertical?
    # check if specified piece has a triplet across verticals

  # winning_horizontal?
    # check if specified piece has a triplet across horizontals

  # diagonals
    # return the diagonal pieces

  # verticals
    # return the vertical pieces

  # horizontals'
    # return the horizontal pieces

  # full?
    # does every square contain a piece?

end