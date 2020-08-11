# frozen_string_literal: true

class MouseManager
  def initialize(parent, board_manager)
    @parent = parent
    @board_manager = board_manager
    @mouse_button_pressed = false

    manage_mouse_down
    manage_mouse_move
  end

  def manage_mouse_down
    @parent.on :mouse_down do |event|
      case event.button
      when :left
        @mouse_button_pressed = true
        @board_manager.activate_electron(event.x, event.y) if @mouse_button_pressed
      when :right
        @mouse_button_pressed = false
        @board_manager.deactivate_conductor(event.x, event.y)
      end
    end
  end

  def manage_mouse_move
    @parent.on :mouse do |event|
      @mouse_button_pressed = false if event.type == :up
      @board_manager.activate_conductor(event.x, event.y) if @mouse_button_pressed
    end
  end
end
