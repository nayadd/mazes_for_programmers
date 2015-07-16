require 'distance_grid'
require 'binary_tree'

n=30

puts "**Longest Path demo**"

puts "Creating #{n}X#{n} DistanceGrid"
grid = DistanceGrid.new(n,n)

puts "Creating maze using BinaryTree Algorithm"
BinaryTree.on(grid)

puts "Printing unresolved maze"
puts grid

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
grid.max_distance = distance

puts "Printing Maze w/ path to Terminal"
puts grid
