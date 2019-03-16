class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq
  attr_writer :reset_game, :require_sequence

  def initialize
    @sequence_length = 1
    @game_over = false 
    @seq = [] 

  end

  def play
    until @game_over == true
      self.take_turn
    end 
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !(@game_over)
      self.round_success_message 
      @sequence_length += 1
    end 
  end

  def show_sequence
    self.add_random_color
    @seq
  end

  def require_sequence
    puts "Please type a color from the set: red, blue, green, yellow"
    user_input = gets.chomp
    @game_over = true if user_input != @seq[-1]
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Successful match"
  end

  def game_over_message
    puts "GaMe OvEr :("
  end

  def reset_game
    @sequence_length = 1 
    @game_over = false 
    @seq = []
  end

end
