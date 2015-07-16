require 'chunky_png'

class Bitgrid
  attr_reader :rows, :columns

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @grid = prepare_grid
  end

  def prepare_grid
    i=0
    Array.new(rows) do |row|
      Array.new(columns) do |column|
        row*1000 + column*100
      end
    end
  end

  def [](row, column)
    return nil unless row.between?(0, @rows - 1)
    return nil unless column.between?(0, @grid[row].count - 1)
    @grid[row][column]
  end

  def random_cell
    row = rand(@rows)
    column = rand(@grid[row].count)
    self[row, column]
  end

  def size
    @rows * @columns
  end

  def each_row
    @grid.each do |row|
      yield row
    end
  end

  def each_cell
    each_row do |row|
      row.each do |cell|
        yield cell
      end
    end
  end


  #Fixnum monkey patching to use old syntax with bitgrid
  Fixnum.class_eval do
    def links
      if self < 10
        links = self
      else
        links = self.to_s[-2,2].to_i
      end
      links
    end

    def linked?(direction)
      mask = {"west":8, "east":4, "south":2, "north":1}
      self.links & mask[direction.to_sym] > 0
    end

    def link(cell)
      link(self,cell)
    end
    
    def row
      self/1000
    end

    def column
      (self-self.row*1000)/100
    end

    def north
      if self.linked?("north")
        (self.row+1)*1000 + (self.column*100)
      else
        nil
      end
    end

    def south
      if self.linked?("south")
        (self.row-1)*1000 + (self.column*100)
      else
        nil
      end
    end

    def east
      if self.linked?("east")
        (self.row*1000) + ((self.column+1)*100)
      else
        nil
      end
    end

    def west
      if self.linked?("west")
        (self.row*1000) + ((self.column-1)*100)
      else
        nil
      end
    end
  end

  def link(orig,cell)
    orig = orig | 1 if (cell.column == orig.column + 1)
    orig = orig | 2 if (cell.column == orig.column - 1)
    orig = orig | 4 if (cell.row == orig.row - 1)
    orig = orig | 8 if (cell.row == orig.row - 1)
  end

  def to_s
    output= "+" + "---+" * columns + "\n"
    each_row do |row|
      top="|"
      bottom = "+"

      row.each do |cell|
        cell = 0 unless cell

        body = "   "

        east_boundary = (cell.linked?("east") ? " " : "|")
        top << body << east_boundary

        south_boundary = (cell.linked?("south") ? "   " : "---")
        corner = "+"
        bottom << south_boundary << corner
      end

      output << top << "\n"
      output << bottom << "\n"
    end

    output
  end

  def to_png(cell_size: 10)
    img_width = cell_size * columns
    img_height = cell_size * rows

    background = ChunkyPNG::Color::WHITE
    wall = ChunkyPNG::Color::BLACK

    img= ChunkyPNG::Image.new(img_width+1, img_height +1, background)

    each_cell do |cell|
      x1 = cell.column * cell_size
      y1 = cell.row * cell_size
      x2 = (cell.column + 1) * cell_size
      y2 = (cell.row + 1) * cell_size

      img.line(x1,y1,x2,y1,wall) unless cell.north
      img.line(x1,y1,x1,y2,wall) unless cell.west
      img.line(x2,y1,x2,y2,wall) unless cell.linked?("east")
      img.line(x1,y2,x2,y2,wall) unless cell.linked?("south")
    end

    img
  end
end
