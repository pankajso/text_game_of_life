class Universe

  attr_reader :cells

  def initialize(dimensions, living_cells_locations=[])
    @dimensions = dimensions
    @dead_cells = Hash.new
    add_cells(living_cells_locations)
  end

  def living_cells_locations
    @cells.select { |location, cell| cell.alive? }.keys
  end

  def valid?
    @dimensions.all? { |value| value >= 0 }
  end

  def tick
    add_cells(living_cells_locations)
    cells_location = @cells.values.collect do |cell|
      new_cell = cell.tick
      if new_cell.alive?
        cell.location
      else
        @dead_cells[cell.location] = new_cell
        nil
      end
    end
    add_cells(cells_location.compact)
    @cells = @dead_cells.merge(@cells)
  end

  def view(viewer)
    viewer.view(living_cells_locations, @dimensions)
  end


  private

  def add_cells(living_cells_locations)
    @cells = Hash.new
    living_cells_locations.each do |location|
      add_or_increment_neighbouring_cells(location)
      if nil_and_within_boundary?(location)
        @cells[location] = Cell.alive(location)
      elsif not_nil_and_within_boundary?(location)
        @cells[location].resurrect
      end
    end
  end


  def add_or_increment_neighbouring_cells(location)
    neighbouring_positions(location).each do |position|
      @cells[position] = Cell.dead(position) if nil_and_within_boundary?(position)
      @cells[position].increment_neighbour unless @cells[position].nil?
    end
  end

  def out_of_bounds?(coordinates)
    @dimensions.zip(coordinates).any? do |dimension, coordinate|
      dimension <= coordinate || coordinate < 0
    end
  end

  def nil_and_within_boundary?(location)
    !out_of_bounds?(location) && @cells[location].nil?
  end

  def not_nil_and_within_boundary?(location)
    !out_of_bounds?(location) && !@cells[location].nil?
  end

  def neighbouring_positions(location)
    x = location[0]
    y = location[1]
    [[x-1, y-1], [x, y-1], [x+1, y-1],
     [x-1, y], [x+1, y],
     [x-1, y+1], [x, y+1], [x+1, y+1]]
  end
end
