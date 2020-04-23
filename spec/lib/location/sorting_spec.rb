require_relative '../../../lib/location/sorting'

describe LocationSorting do

  describe '#find_previous_node' do

    before(:each) do
      @top_score = LocationNode.new(0, 0, 12)
      @node2 = LocationNode.new(1, 3, 9, @top_score)
      @top_score.next_node = @node2
      @node3 = LocationNode.new(2, 0, 7, @node2)
      @node2.next_node = @node3
    end

    it 'should return nil when new node has the higher score' do
      # Given
      node = LocationNode.new(0, 1, 19)

      # When
      previous_node = LocationSorting.find_previous_node(node, @top_score)

      # Then
      expect(previous_node).to be_nil
    end

    it 'should return last node when new node has the lowest score' do
      # Given
      node = LocationNode.new(0, 1, 5)

      # When
      previous_top = LocationSorting.find_previous_node(node, @top_score)

      # Then
      expect(previous_top).to be == @node3
    end

    it 'should return root node when new node has the second highest score' do
      # Given
      node = LocationNode.new(0, 1, 10)

      # When
      previous_top = LocationSorting.find_previous_node(node, @top_score)

      # Then
      expect(previous_top).to be == @top_score
    end

  end

  describe '#add_location' do

    before(:each) do
      @top_score = LocationNode.new(0, 0, 12)
      @node2 = LocationNode.new(1, 3, 9, @top_score)
      @top_score.next_node = @node2
      @node3 = LocationNode.new(2, 0, 7, @node2)
      @node2.next_node = @node3
    end

    it 'should add a new node as root if highest score' do
      # Given
      x = 0
      y = 1
      score = 19

      # When
      root = LocationSorting.add_location(x, y, score, @top_score)

      # Then
      expect(root.score).to be == score
      expect(root.coord_x).to be == x
      expect(root.coord_y).to be == y
      expect(root.prev_node).to be_nil
      expect(root.next_node).to be == @top_score
      expect(@top_score.prev_node).to be == root
    end

    it 'should add a new node at the end if lowest score' do
      # Given
      x = 0
      y = 1
      score = 5

      # When
      root = LocationSorting.add_location(x, y, score, @top_score)

      # Then
      new_node = @node3.next_node
      expect(root).to be == @top_score
      expect(new_node.coord_x).to be == x
      expect(new_node.coord_y).to be == y
      expect(new_node.score).to be == score
      expect(new_node.prev_node).to be == @node3
      expect(new_node.next_node).to be_nil
    end

    it 'should add a new node after root if second highest score' do
      # Given
      x = 0
      y = 1
      score = 10

      # When
      root = LocationSorting.add_location(x, y, score, @top_score)

      # Then
      new_node = root.next_node
      expect(root).to be == @top_score
      expect(new_node.coord_x).to be == x
      expect(new_node.coord_y).to be == y
      expect(new_node.score).to be == score
      expect(new_node.prev_node).to be == @top_score
      expect(new_node.next_node).to be == @node2
    end
  end
end 
