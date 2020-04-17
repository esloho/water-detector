
module LocationSorting
  extend self

  def add_location(x, y, score, top_score)
    node = LocationNode.new(x, y, score)

    return node if top_score.nil?

    previous_node = find_previous_node(node, top_score)

    if previous_node.nil?
      node.add_before(top_score)
      return node
    end

    node.add_after(previous_node)

    top_score
  end

  def find_previous_node(node, current)
    return current if current.next_node.nil?
    return current.prev_node if node.score > current.score

    find_previous_node(node, current.next_node)
  end
end
