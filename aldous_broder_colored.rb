require 'colored_grid'
require 'aldous_broder'
6.times do |n|
  grid = ColoredGrid.new(20, 20)
  AldousBroder.on(grid)
  middle = grid[grid.rows / 2, grid.columns / 2]
  grid.distances = middle.distances
  filename = "AldousBroder/aldous_broder_#{format('%02d',n)}_#{Time.now}.png"
  grid.to_png.save(filename)
  puts "saved to #{filename}"
end
