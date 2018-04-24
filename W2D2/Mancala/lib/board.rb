require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){Array.new}
    place_stones
    @player1 = name1 # cup at idx 6
    @player2 = name2 # cup at idx 13

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index {|i| @cups[i] +=[:stone,:stone,:stone,:stone] unless i == 6 || i == 13}
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0,12) || start_pos == 6
      raise "Invalid starting cup" # wrong cup selected
    elsif @cups[start_pos].empty?
      raise "Invalid starting cup" # cup empty, nothing to pick up
    end
    true
  end

  def make_move(start_pos, current_player_name)
    # render
    if valid_move?(start_pos)
      stones = @cups[start_pos]
      @cups[start_pos] = []
      index = start_pos

      until stones.length == 0
        index +=1
        next if current_player_name == @player1 && index == 13
        next if current_player_name == @player2 && index == 6
        @cups[index % @cups.length] << stones.pop
      end
      render
      return  next_turn(index % @cups.length)
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count
    if player1_count == player2_count
      :draw
    else
      player1_count > player2_count ? @player1 : @player2
    end
  end
end
