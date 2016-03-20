class TextViewer
  def view(living_cells_locations, dimensions)
    @living_cells_locations = living_cells_locations
    @dimensions = dimensions
  end

  def to_s
    printable_array = Array.new(@dimensions[0]) { Array.new(@dimensions[1]) { 0 } }
    @living_cells_locations.each do |location|
      printable_array[location[0]][location[1]] = 1
    end
    printable_array.map { |row| row.join(' ') }.join("\n")
  end
end

