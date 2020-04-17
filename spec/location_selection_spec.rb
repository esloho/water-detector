require 'location_selection'

describe LocationSelection do

  describe '#get_sorted_area_scores' do

    it 'should return sorted linked list of location' do
      # Given
      grid = [5, 3, 1, 2, 4, 1, 1, 3, 2, 3, 2, 4, 0, 2, 3, 3]
      n = 4

      # When
      first_location = LocationSelection.get_sorted_area_scores(n, grid)

      # Then
      expect(first_location.score).to be == 22
      expect(first_location.coord_x).to be == 1
      expect(first_location.coord_y).to be == 1

      second_location = first_location.next_node
      expect(second_location.score).to be == 22
      expect(second_location.coord_x).to be == 2
      expect(second_location.coord_y).to be == 2

      third_location = second_location.next_node
      expect(third_location.score).to be == 20
      expect(third_location.coord_x).to be == 1
      expect(third_location.coord_y).to be == 2
    end

  end

  describe '#print_top_results' do

    before(:each) do
      @top_location = LocationNode.new(0, 0, 12)
      @node2 = LocationNode.new(1, 3, 9, @top_location)
      @top_location.next_node = @node2
      @node3 = LocationNode.new(2, 0, 7, @node2)
      @node2.next_node = @node3
    end

    it 'should not print anything for t = 0' do
      # Given
      t = 0

      # Then
      expect { LocationSelection.print_top_locations(t, @top_location) }.to_not output.to_stdout
    end

    it 'should not print anything if empty list' do
      # Given
      t = 3

      # Then
      expect { LocationSelection.print_top_locations(t, nil) }.to_not output.to_stdout
    end

    it 'should print first result for t==1' do
      # Given
      t = 2
      message = "(0, 0, score: 12)\n(1, 3, score: 9)\n"

      # Then
      expect { LocationSelection.print_top_locations(t, @top_location) }.to output(message).to_stdout
    end

    it 'should print until last location when t is higher than list length' do
      # Given
      t = 4
      message = "(0, 0, score: 12)\n(1, 3, score: 9)\n(2, 0, score: 7)\n"

      # Then
      expect { LocationSelection.print_top_locations(t, @top_location) }.to output(message).to_stdout
    end
  end
end 
