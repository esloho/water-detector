require_relative '../lib/location_selection'

describe LocationSelection do

  describe '#get_sorted_area_scores' do

    it 'should return scores grid' do
      # Given
      grid = [5, 3, 1, 2, 4, 1, 1, 3, 2, 3, 2, 4, 0, 2, 3, 3]
      n = 4

      # When
      scores_grid, _ = LocationSelection.get_sorted_area_scores(n, grid)

      # Then
      expect(scores_grid.length).to be == grid.length
      expect(scores_grid[0]).to be == [0, 0, 13]
      expect(scores_grid[1]).to be == [0, 1, 18]
      expect(scores_grid[4]).to be == [1, 0, 15]
    end

    it 'should return sorted linked list of location' do
      # Given
      grid = [5, 3, 1, 2, 4, 1, 1, 3, 2, 3, 2, 4, 0, 2, 3, 3]
      n = 4

      # When
      _, first_location = LocationSelection.get_sorted_area_scores(n, grid)

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
      expect(third_location.coord_x).to be == 2
      expect(third_location.coord_y).to be == 1
    end

  end

  describe '#get_top_locations_info' do

    before(:each) do
      @top_location = LocationNode.new(0, 0, 12)
      @node2 = LocationNode.new(1, 3, 9, @top_location)
      @top_location.next_node = @node2
      @node3 = LocationNode.new(2, 0, 7, @node2)
      @node2.next_node = @node3
    end

    it 'should not generate anything for t = 0' do
      # Given
      t = 0

      # When
      messages = LocationSelection.get_top_locations_info([], t, @top_location)

      # Then
      expect(messages).to be_empty
    end

    it 'should not generate anything if empty list' do
      # Given
      t = 3

      # When
      messages = LocationSelection.get_top_locations_info([], t, nil)

      # Then
      expect(messages).to be_empty
    end

    it 'should generate message for first result when t==1' do
      # Given
      t = 2

      # When
      messages = LocationSelection.get_top_locations_info([], t, @top_location)

      # Then
      expect(messages).to be == ["(0, 0, score: 12)", "(1, 3, score: 9)"]
    end

    it 'should generate messages until last location when t is higher than list length' do
      # Given
      t = 4

      # When
      messages = LocationSelection.get_top_locations_info([], t, @top_location)

      # Then
      expect(messages).to be == ["(0, 0, score: 12)", "(1, 3, score: 9)", "(2, 0, score: 7)"]
    end
  end
end 
