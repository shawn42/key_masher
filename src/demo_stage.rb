class DemoStage < Stage
  def setup
    super
    sound_manager.play_music :current_rider
    
    spawn :alpha_soup
  end
end

