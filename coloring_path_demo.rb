require 'colored_path_grid'
require 'binary_tree'
require 'sidewinder'

n=25

puts "**Coloring Path demo**"

puts "Creating #{n}X#{n} ColoredPathGrid"
grid = ColoredPathGrid.new(n,n)

puts "Creating maze using BinaryTree Algorithm"
BinaryTree.on(grid)

puts "Setting start cell on Grid"
start = grid[0,0]

puts "Calculating distances from Start cell"
distances = start.distances

puts "Defining the most distant point as new starting cell"
new_start, distance = distances.max

puts "Calculating distances from New Starting cell"
new_distances = new_start.distances
puts "Defining the most distant point as goal cell"
goal, distance = new_distances.max

puts "Calculating path from new starting point to goal cell"
grid.distances = new_distances.path_to(goal)

filename = "ColorizedPathBT#{Time.now}.png"
puts "Saving to #{filename}"
img = grid.to_png
img.save filename
puts "SAVED!"
