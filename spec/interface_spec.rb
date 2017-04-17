require './spec/spec_helper.rb'

describe "Interface" do

  WHICH_PIECE_ANSWER = "knight\n"
  START_ANSWER = "[4, 7]\n"
  START_STRING = "[4, 7]"
  FINISH_ANSWER = "[0, 4]\n"
  FINISH_STRING = "[0, 4]"
  PATH_STRING = "[[4, 7], [3, 5], [2, 3], [0, 4]]"

  let(:output_interface) {StringIO.new}
  let(:input_interface) {StringIO.new}

  subject do
    Interface.new(output_interface: output_interface, input_interface: input_interface)
  end

  describe "which_piece?" do
    let(:input_interface) {StringIO.new(WHICH_PIECE_ANSWER)}
    before do
      subject.which_piece?
    end
    it "should ask the user which piece they want to traverse with" do
      expect(output_interface.string).to include(Interface::WHICH_PIECE)
    end
  end

  describe "start?" do
    let(:input_interface) {StringIO.new(START_ANSWER)}
    before do
      subject.start?
    end
    it "should ask the user where the piece should start" do
      expect(output_interface.string).to include(Interface::START)
    end
  end

  describe "finish?" do
    let(:input_interface) {StringIO.new(FINISH_ANSWER)}
    before do
      subject.finish?
    end
    it "should ask the user where the piece should finish" do
      expect(output_interface.string).to include(Interface::FINISH)
    end
  end

  describe "path" do
    before do
      subject.print_path(piece: "knight", start: START_STRING, finish: FINISH_STRING)
    end
    it "should ask the user where the piece should finish" do
      expect(output_interface.string).to include(PATH_STRING)
    end
  end

end
