# frozen_string_literal: true

require 'ruby2d'
require_relative './classes/board/board_manager.rb'
require_relative './classes/input//mouse_manager.rb'

set(width: 576, height: 576)
board_manager = BoardManager.new
MouseManager.new(self, board_manager)

show
