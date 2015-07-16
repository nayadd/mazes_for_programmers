require 'bitgrid'
require 'sidewinder'
require 'binary_tree'

n=4

puts "Creating #{n}X#{n} Grid"
grid = Bitgrid.new(n,n)

puts "Creating maze using Sidewinder Algorithm"
Sidewinder.on(grid)

puts "Displaying Maze!"
puts grid

puts "printing to png"
img = grid.to_png
img.save "SWMaze#{Time.now}.png"

puts "Creating #{n}X#{n} Grid"
grid = Bitgrid.new(n,n)

puts "Creating maze using Binary Tree Algorithm"
BinaryTree.on(grid)

puts "Displaying Maze!"
puts grid

puts "printing to png"
img = grid.to_png
img.save "BTMaze#{Time.now}.png"
