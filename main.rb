# frozen_string_literal: true

# Main class for Tic Tac Toe

# This is the board class, responsible for initially creating the board for the user
class BoardCreation
    def initialize(board)
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts '---+---+---'
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts '---+---+---'
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end
end



# Class responsible for requesting user inputs.
class PlayerInputs


    # Method for player 1 input
    def self.player1_input(board)
        
        # Provides a border at the bottom for better board view:
        puts "=================="

        @board = board
        # Obtain input from player 1
        input = gets.chomp!
        input = input.to_i
        input -= 1

        # While the input is not correct (between 1 and 9 ask again)
        while input < 0 || input >= 9
            puts 'Please enter a value between 1 and 9'
            input = gets.chomp!
            input = input.to_i
            input -= 1

        end

        # While the current value has already been taken
        while GameLogic.check_for_previous_input(board, input)
            puts 'Please enter a value that has not been previously taken'
            input = gets.chomp!
            input = input.to_i
            input -= 1
        end

        # Update the board
        @board[input.to_i] = "X"
        BoardCreation.new(@board)

    end



    # Method for player 2 input
    def self.player2_input(board)

        # Provides a border at the bottom for better board view:
        puts "=================="

        @board = board
        # Obtain input from player 2
        input = gets.chomp!
        input = input.to_i
        input -= 1
        
        # While the input is not correct (between 1 and 9 ask again)
        while input < 0 || input  >= 9
            puts 'Please enter a value between 1 and 9'
            input = gets.chomp!
            input = input.to_i
            input -= 1
        end

        # While the current value has already been taken
        while GameLogic.check_for_previous_input(board, input)
            puts 'Please enter a value that has not been previously taken'
            input = gets.chomp!
            input = input.to_i
            input -= 1

        end

        # Update the board
        @board[input.to_i] = "Y"
        BoardCreation.new(@board)
        
    end
end



# Call this class to begin the Tic Tac Toe game.
class BeginGame
    def initialize(board)
        # Variable to house the current board
        @current_board = board
        
        # Request inputs as long as no event has occured [game winner or tie]
        (1...6).each do |_a|
            # Get the input from player 1
            PlayerInputs.player1_input(@current_board)
            GameLogic.check_for_winner(@current_board)
            
            # If _a reaches 5 end the game as players have moved a maximum number of times. The game has reached a tie.
            if _a == 5
                break
            end


            # Get the input from player 2
            PlayerInputs.player2_input(@current_board)
            GameLogic.check_for_winner(@current_board)
            
        end

        # If we have looped through the game's entirety and no winner has been declared. Then announce the game as a tie game:
        puts "The game was a tie!"
        puts "Would you like to start a new game? Y/N"

        
    end


end



# This class will be responsible for game logic
class GameLogic

    # This method checks for a winner or a tie
    def self.check_for_winner(board)
        @board = board
        
        # Logic for all rows first: Starting with player X
        if @board[0] == 'X' && @board[1] == 'X' && @board[2] == 'X'
            puts "Player X has won the game!"
            InitializeGame.new
        elsif @board[3] == 'X' && @board[4] == 'X' && @board[5] == 'X'
            puts "Player X has won the game!"
            InitializeGame.new
        elsif @board[6] == 'X' && @board[7] == 'X' && @board[8] == 'X'
            puts "Player X has won the game!"
            InitializeGame.new

        # Logic for all the columns:    
        elsif @board[0] == 'X' && @board[3] == 'X' && @board[6] == 'X'
            puts "Player X has won the game!"
            InitializeGame.new
        elsif @board[1] == 'X' && @board[4] == 'X' && @board[7] == 'X'
            puts "Player X has won the game!"
            InitializeGame.new
        elsif @board[2] == 'X' && @board[5] == 'X' && @board[8] == 'X'
            puts "Player X has won the game!"
            InitializeGame.new

        # Logic for all the diagonals   
        elsif @board[0] == 'X' && @board[4] == 'X' && @board[8] == 'X'
            puts "Player X has won the game!"
            InitializeGame.new
        elsif @board[2] == 'X' && @board[4] == 'X' && @board[6] == 'X'
            puts "Player X has won the game!"
            InitializeGame.new
        end


        # Logic for all rows first: For player Y
        if @board[0] == 'Y' && @board[1] == 'Y' && @board[2] == 'Y'
            puts "Player Y has won the game!"
            InitializeGame.new
        elsif @board[3] == 'Y' && @board[4] == 'Y' && @board[5] == 'Y'
            puts "Player Y has won the game!"
            InitializeGame.new
        elsif @board[6] == 'Y' && @board[7] == 'Y' && @board[8] == 'Y'
            puts "Player Y has won the game!"
            InitializeGame.new

        # Logic for all the columns:    
        elsif @board[0] == 'Y' && @board[3] == 'Y' && @board[6] == 'Y'
            puts "Player Y has won the game!"
            InitializeGame.new
        elsif @board[1] == 'Y' && @board[4] == 'Y' && @board[7] == 'Y'
            puts "Player Y has won the game!"
            InitializeGame.new
        elsif @board[2] == 'Y' && @board[5] == 'Y' && @board[8] == 'Y'
            puts "Player Y has won the game!"
            InitializeGame.new

        # Logic for all the diagonals   
        elsif @board[0] == 'Y' && @board[4] == 'Y' && @board[8] == 'Y'
            puts "Player Y has won the game!"
            InitializeGame.new
        elsif @board[2] == 'Y' && @board[4] == 'Y' && @board[6] == 'Y'
            puts "Player Y has won the game!"
            InitializeGame.new
        end



    end


    # This method checks if there is already an X or an O at a particular value
    def self.check_for_previous_input(board, input)
        @current_board = board
        @current_input = input.to_i
        
        if @current_board[@current_input] == 'X' || @current_board[@current_input] == 'Y'
            return true
        end
        false
    end


end


# Call this class to create a new instance of the game
class InitializeGame
    def initialize()
        # Welcome message to the user. Explains rules:
        puts "\n+------------------------------------+"
        puts "Welcome to Tic Tac Toe. This is a 2 player game, player 1 starts with X and player 2 starts with Y."
        puts "Please enter a value between 1 and 9 to update the board."
        puts "+------------------------------------+"

        # Create an array that is numbered from 1 to 9:
        board = Array.new(9) { |i| i + 1 }

        # Create a new BoardCreation object that will populate the current board.
        BoardCreation.new(board)

        # Begin the game
        BeginGame.new(board)

    end

end

# Start the game:
InitializeGame.new



