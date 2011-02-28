class LetterView < GraphicalActorView
end

class Letter < Actor
  has_behavior :updatable
  attr_reader :scale, :alpha
  def setup
    super
    @letter = opts[:letter]
    @scale = opts[:scale]
    @scale_tween = Tween.new([@scale,0], [@scale*(3-rand(3)),0], Tween::Quart::InOut, 3)
    @ttl_tween = Tween.new([0xFF,0], [0,0], Tween::Quart::InOut, 10)
    x_drift = x+(800-rand(1600))
    y_drift = y+(600-rand(1200))
    @pos_tween = Tween.new([x,y], [x_drift,y_drift], Tween::Bounce::Out, 2)
  end

  def update(delta_ms)
    delta_secs = delta_ms/1000.0
    @ttl_tween.update(delta_secs)
    @pos_tween.update(delta_secs)
    @scale_tween.update(delta_secs)
    self.x = @pos_tween.x
    self.y = @pos_tween.y
    remove_self if @ttl_tween.done
  end

  def scale
    @scale_tween.x
  end

  def alpha
    @ttl_tween.x.ceil
  end

  def image
    @image ||= resource_manager.load_image "#{@letter}.png"
    @image ||= resource_manager.load_image "a.png"
  end
end
