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

  def info
    "(#{@coord_x}, #{@coord_y}, score: #{@score})"
  end
end
