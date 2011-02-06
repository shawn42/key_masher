class AlphaSoup < Actor
  has_behavior :audible

  def setup
    input_manager.reg :keyboard_down do |evt|
      id = evt[:id]
      if id <= KbRangeEnd && id >= KbRangeBegin
        scale = rand
        spawn :letter, :x => rand(stage.viewport.width), :y => rand(stage.viewport.height), :letter => KEY2ASCII[id], :scale => (1+scale)
        play_sound :new_letter
      end
    end
  end
end
