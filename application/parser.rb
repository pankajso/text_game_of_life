class Parser
  def initialize(inp)
    @inputtxt = inp
    @dimensions = nil
    @locations = nil   
  end

  def locations
    parse_and_tokenize unless @locations
    @locations
  end

  def dimensions
    parse_and_tokenize unless @dimensions
    @dimensions
  end

  private

  def parse_and_tokenize
    @inputtxt = @inputtxt.split("\n").map {|cell| cell.split(' ')}
    @dimensions = [@inputtxt.size, @inputtxt[0].size ]
    @inputtxt = @inputtxt.map.with_index do |outer, outer_index|
      outer.map.with_index do |inner, inner_index|
        inner_array.to_i <= 0 ? nil : [outer_index, inner_index]
      end
    end
    @locations = @inputtxt.flatten.compact.each_slice(2).to_a
  end
end
