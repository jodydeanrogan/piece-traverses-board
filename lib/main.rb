require './lib/piece.rb'
require './lib/board.rb'
require './lib/queue.rb'
require './lib/node.rb'
require './lib/interface.rb'

interface = Interface.new
piece = interface.which_piece?
start = interface.start?
finish = interface.finish?
interface.print_path(piece: piece, start: start, finish: finish)
