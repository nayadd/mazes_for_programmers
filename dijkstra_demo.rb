require 'distance_grid'
require 'binary_tree'
require 'sidewinder'

n=5

puts "Creating #{n}X#{n} DistanceGrid"
grid = DistanceGrid.new(n,n)

puts "Creating maze using BinaryTree Algorithm"
BinaryTree.on(grid)

puts "Setting Starting Point [0,0] and calculating distances"
start = grid[0,0]
distances = start.distances

grid.distances = distances

puts "Printing Grid (with distances to Terminal"
puts grid

puts "Setting and calculating path from NW corner to SW corner"
grid.distances = distances.path_to(grid[grid.rows - 1,0])
puts "Printing grid with shortest path to Terminal"
puts grid.to_s
