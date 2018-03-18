require 'minitest/autorun'
require 'minitest/spec'
require 'grid'
require 'rmagick'

describe Grid do
  it "raises an exception if no rmagick object is provided" do
    grid = Grid.new 5,5,2
    proc { grid.get }.must_raise Exception 
  end

  it "lets you specify an input image" do
    grid = Grid.new 5,5,2
    grid.load_image "./spec/assets/map.jpg"
    grid.image.must_be_kind_of Magick::Image
  end

  it "defines settings on new instance" do
    grid = Grid.new 5,5,2
    
    grid.cell_width.must_be :==,5
    grid.cell_height.must_be :==,5
    grid.cell_border.must_be :==,2
  end


end
