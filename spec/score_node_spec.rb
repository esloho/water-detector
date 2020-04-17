require 'score_node'

describe ScoreNode do

  describe '#initalize' do

    it 'should have previous and next links to nil after creation' do
      # Given
      coord_x = 0
      coord_y = 0
      score = 12

      # When
      node = ScoreNode.new(coord_x, coord_y, score)

      # Then
      expect(node.prev_node).to be_nil
      expect(node.next_node).to be_nil
    end

  end

  describe '#connect_to' do

    it 'should add the node between the one given and its previous one' do
      # Given
      node1 = ScoreNode.new(0, 0, 12)
      node2 = ScoreNode.new(1, 3, 9, node1)
      node1.next_node = node2

      new_node = ScoreNode.new(2, 1, 11)

      # When
      new_node.connect_to(node2)

      # Then
      expect(new_node.prev_node).to be == node1
      expect(new_node.next_node).to be == node2
      expect(node1.prev_node).to be_nil
      expect(node1.next_node).to be == new_node
      expect(node2.prev_node).to be == new_node
      expect(node2.next_node).to be_nil
    end

  end
end 
