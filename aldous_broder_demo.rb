require 'grid'
require 'aldous_broder'
n = 20
grid = Grid.new(n,n)

AldousBroder.on(grid)

filename = "AldousBroder/aldous_broder#{Time.now}.png"
grid.to_png.save(filename)
puts "saved to #{filename}"
