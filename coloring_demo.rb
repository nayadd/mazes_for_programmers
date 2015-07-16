require 'colored_grid'
require 'binary_tree'
require 'sidewinder'

n=1000

puts "**Coloring Path demo**"

puts "Creating #{n}X#{n} ColoredGrid"
grid = ColoredGrid.new(n,n)

puts "Creating maze using BinaryTree Algorithm"
BinaryTree.on(grid)

puts "Defining Starting Point (middle of grid)"
start = grid[0, 0]

puts "Calculating distances from starting point"
grid.distances = start.distances

filename = "ColorizedBT#{Time.now}.png"
puts "Saving to #{filename}"
img = grid.to_png
img.save filename

puts "Creating #{n}X#{n} ColoredGrid"
grid = ColoredGrid.new(n,n)

puts "Creating maze using SideWinder Algorithm"
Sidewinder.on(grid)

puts "Defining Starting Point (middle of grid)"
start = grid[0, 0]

puts "Calculating distances from starting point"
grid.distances = start.distances

filename = "ColorizedSW#{Time.now}.png"
puts "Saving to #{filename}"
img = grid.to_png
img.save filename
