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
end 
