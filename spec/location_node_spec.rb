require_relative '../lib/location_node'

describe LocationNode do

  describe '#initalize' do

    it 'should have previous and next links to nil after creation' do
      # Given
      coord_x = 0
      coord_y = 0
      score = 12

      # When
      node = LocationNode.new(coord_x, coord_y, score)

      # Then
      expect(node.prev_node).to be_nil
      expect(node.next_node).to be_nil
    end

  end

  describe '#add_after' do

    before(:each) do
      @node1 = LocationNode.new(0, 0, 12)
      @node2 = LocationNode.new(1, 3, 9, @node1)
      @node1.next_node = @node2
    end

    it 'should add the node between the one given and its next one' do
      # Given
      new_node = LocationNode.new(2, 1, 11)

      # When
      new_node.add_after(@node1)

      # Then
      expect(new_node.prev_node).to be == @node1
      expect(new_node.next_node).to be == @node2
      expect(@node1.prev_node).to be_nil
      expect(@node1.next_node).to be == new_node
      expect(@node2.prev_node).to be == new_node
      expect(@node2.next_node).to be_nil
    end

    it 'should add the node at last position if given the last node' do
      # Given
      new_node = LocationNode.new(2, 1, 11)

      # When
      new_node.add_after(@node2)

      # Then
      expect(new_node.prev_node).to be == @node2
      expect(new_node.next_node).to be_nil
      expect(@node2.prev_node).to be == @node1
      expect(@node2.next_node).to be == new_node
    end

  end

  describe '#add_before' do

    before(:each) do
      @node1 = LocationNode.new(0, 0, 12)
      @node2 = LocationNode.new(1, 3, 9, @node1)
      @node1.next_node = @node2
    end

    it 'should add the node at first position if given a root node' do
      # Given
      new_node = LocationNode.new(2, 1, 11)

      # When
      new_node.add_before(@node1)

      # Then
      expect(new_node.prev_node).to be_nil
      expect(new_node.next_node).to be == @node1
      expect(@node1.prev_node).to be == new_node
      expect(@node1.next_node).to be == @node2
    end

  end

end 
