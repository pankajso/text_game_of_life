class GameOfLife
  def initialize(input, generations)
    @number_of_generation = generation
    parser = Parser.new(input)
    @universe = Universe.new(parser.dimensions, parser.locations)
  end

  def start
    @number_of_generation.times do
      @universe.tick
    end
  end


  def print_universe
    viewer = TextViewer.new
    @universe.view(viewer)
    viewer.to_s
  end
end
