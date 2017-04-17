class Interface

  attr_reader :output_interface, :input_interface

  WHICH_PIECE = "Which piece would you like to traverse with?"
  START = "Where should this piece start?"
  FINISH = "Where should this piece finish?"

  def initialize(output_interface: STDOUT, input_interface: STDIN)
    @output_interface = output_interface
    @input_interface = input_interface
  end

  def which_piece?
    self.output_interface.puts WHICH_PIECE
    answer = self.input_interface.gets.chomp
  end

  def start?
    self.output_interface.puts START
    answer = self.input_interface.gets.chomp
  end

  def finish?
    self.output_interface.puts FINISH
    answer = self.input_interface.gets.chomp
  end

end
