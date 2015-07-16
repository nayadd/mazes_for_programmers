require 'grid'
require 'binary_tree'

n=4

puts "Creating #{n}X#{n} Grid"
grid = Grid.new(n,n)

puts "Creating maze using Binary Tree Algorithm"
BinaryTree.on(grid)

puts "Displaying Maze!"
grid.to_s true

puts "printing to png"
img = grid.to_png
img.save "BTMaze#{Time.now}.png"
