require "byebug"
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn

    unless @game_over
      round_success_message
      show_sequence
      input = require_sequence
      @game_over = true unless input_correct?(input)
      print_sequence_length
      @sequence_length += 1
    else
       game_over_message
       reset_game
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      print "#{color}  "
      sleep(1)
    end
    system "clear"
    print "\n"
  end

  def require_sequence
    puts "Enter the sequence ex: R,G,B"
    input = gets.chomp.split(",").map do |char|
      case char.downcase
      when "r"
        char = "red"
      when "g"
        char =  "green"
      when "b"
        char = "blue"
      when "y"
        char = "yellow"
      end
    end
    input
  end

  def input_correct?(color_seq)
    color_seq == @seq
  end

  def add_random_color
    @seq.push(COLORS.sample)
  end

  def round_success_message
    puts "Correct!" unless @seq.length == 0
  end

  def print_sequence_length
    puts "Last color sequence length was: #{@sequence_length}"
  end

  def game_over_message
    puts "Game Over!"
    puts "colors were: #{@seq}"
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end

if $PROGRAM_NAME == __FILE__
  game = Simon.new
  game.play
end
