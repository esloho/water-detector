class LocationNode

  attr_reader :coord_x
  attr_reader :coord_y
  attr_reader :score
  attr_accessor :prev_node
  attr_accessor :next_node

  def initialize(x, y, score, prev_node=nil, next_node=nil)
    @coord_x = x
    @coord_y = y
    @score = score
    @prev_node = prev_node
    @next_node = next_node
  end

  def add_after(previous_node)
    @prev_node = previous_node
    @next_node = previous_node.next_node

    previous_node.next_node = self
    @next_node.prev_node = self unless @next_node.nil?
  end

  def add_before(next_node)
    @prev_node = next_node.prev_node
    @next_node = next_node

    next_node.prev_node = self
    @prev_node.next_node = self unless @prev_node.nil?
  end

  def info
    "(#{@coord_x}, #{@coord_y}, score: #{@score})"
  end

end
