require 'grid'
require 'sidewinder'


n=4
puts "**SideWinder demo**"

puts "Creating #{n}X#{n} Grid"
grid = Grid.new(n,n)

puts "Creating maze using Sidewinder Algorithm"
Sidewinder.on(grid)

puts "Displaying Maze!"
puts grid

puts "printing to png"
img = grid.to_png
img.save "SWMaze#{Time.now}.png"
