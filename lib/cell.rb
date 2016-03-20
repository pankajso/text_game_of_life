class Cell

  ALIVE = 'alive'
  DEAD = 'dead'

  def self.alive(*location)
    Cell.new(Cell::ALIVE, *location)
  end

  def self.dead(*location)
    Cell.new(Cell::DEAD, location)
  end

  attr_reader :location, :neighbour_count, :status

  def initialize(status, *location)
    @status = status
    @location = *location.flatten
    @neighbour_count = 0
  end

  def ==(other_cell)
     (object_id == other_cell.object_id) || (hash == other_cell.hash) || (self.class == other_cell.class && location == other_cell.location && status == other_cell.status)
  end

  alias :eql? :==

  def tick
    if (neighbour_count == 2 || neighbour_count == 3) && status == ALIVE
      Cell.alive(@location)
    elsif neighbour_count == 3 && status == DEAD
      Cell.alive(@location)
    else
      Cell.dead(@location)
    end
  end

  def increment_neighbour
    @neighbour_count +=1
  end

  def resurrect
    @status = ALIVE
  end

  def alive?
    @status == ALIVE
  end
end