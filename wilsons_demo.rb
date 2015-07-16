require 'grid'
require 'wilsons'

grid = Grid.new(20, 20)
Wilsons.on(grid)
filename = "Wilsons/wilsons_#{Time.now}.png"
grid.to_png.save(filename)
puts "saved to #{filename}"
