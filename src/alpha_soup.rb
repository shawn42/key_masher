class AlphaSoup < Actor
  has_behavior :audible

  def setup
    @a = 'a'.bytes.first
    @mouse_letter = 0

    input_manager.reg :mouse_down do |evt|
      spawn_letter (@mouse_letter + @a).chr
      @mouse_letter = (@mouse_letter + 1) % 26
    end

    input_manager.reg :keyboard_down do |evt|
      id = evt[:id]
      if id <= KbRangeEnd && id >= KbRangeBegin
        spawn_letter KEY2ASCII[id]
      end
    end
  end

  def spawn_letter(letter)
    scale = rand
    spawn :letter, :x => rand(stage.viewport.width), :y => rand(stage.viewport.height), :letter => letter, :scale => (1+scale)
    play_sound :new_letter
  end
end
