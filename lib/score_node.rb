class ScoreNode

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

  def connect_to(previous_top)
    @prev_node = previous_top.prev_node
    @next_node = previous_top

    @prev_node.next_node = self unless @prev_node.nil?
    previous_top.prev_node = self
  end

  def info
    "(#{@coord_x}, #{@coord_y}, score: #{@score})"
  end

end
