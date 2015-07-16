require 'grid'
require 'chunky_png'

class ColoredPathGrid < Grid
  attr_accessor :distances

  def distances=(distances)
    @distances = distances
    farthest, @maximum = distances.max
  end

  def background_color_for(cell)
    if distances && distances[cell]
      ChunkyPNG::Color('black @ 0.5')
    else
      ChunkyPNG::Color::WHITE
    end
  end

  def contents_of(cell)
    if distances && distances[cell]
      distances[cell].to_s(36)
    else
      super
    end
  end
end
