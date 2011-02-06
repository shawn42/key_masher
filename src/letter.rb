class LetterView < GraphicalActorView
end

class Letter < Actor
  attr_reader :scale
  def setup
    @letter = opts[:letter]
    @scale = opts[:scale]
  end

  def image
    @image ||= resource_manager.load_image "#{@letter}.png"
    @image ||= resource_manager.load_image "a.png"

    @image
  end
end
