require 'rmagick'

class Grid
  attr_accessor :image,:cell_width,:cell_height,:cell_border
  
  def initialize(cell_width,cell_height,cell_border)
    @cell_width = cell_width
    @cell_height = cell_height
    @cell_border = cell_border
    @color = 'black'#set default color
  end

  #change color of the grid
  def set_color(color)
    @color = color
  end

  #loads the original image
  def load_image(image)
    @image = Magick::Image.read(image).first
  end

  #draws a grid over the original image based on the current settings
  def draw
    @width = @image.columns
    @height = @image.rows
    gc = Magick::Draw.new
    gc.stroke(@color)
    
    #draw horizontal lines
    (0...@height).step(cell_height) do |i|
      gc.line(0,i,@width,i)
      i += cell_height
    end
    
     #draw vertical lines
    (0...@width).step(cell_width) do |i|
      gc.line(i,0,i,@height)
      
    end
    gc.draw(@image)
  end
  
  # returns a modified rmagick object with a grid superimposed
  def get
    unless @image.kind_of? Magick::Image
      raise TypeError, "images must be set and be an instance of RMagick::Image"
    end
    
    draw
    @image #returns image with grid drawn on top
  end
  
end
  
