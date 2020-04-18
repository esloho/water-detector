require_relative '../lib/score_calculation'

describe ScoreCalculation do

  describe '#get_limits' do

    it 'should return [0, x+1] for coordinate at beginnig' do
      # Given
      n = 4
      x = 0

      # When
      limits = ScoreCalculation.get_limits(x, n)

      # Then
      expect(limits).to be == [0, 1]
    end

    it 'should return [x-1, n] for coordinate at the end' do
      # Given
      n = 4
      x = 2

      # When
      limits = ScoreCalculation.get_limits(x, n)

      # Then
      expect(limits).to be == [1, 3]
    end

    it 'should return [x-1, x+1] for middle coordinate' do
      # Given
      n = 4
      x = 2

      # When
      limits = ScoreCalculation.get_limits(x, n)

      # Then
      expect(limits).to be == [1, 3]
    end
  end

  describe '#get_area_score' do

    it 'should calculate area score for top-left cell' do
      # Given
      grid = [5, 3, 1, 4, 1, 1, 2, 3, 2]
      n = 3
      coord_x = 0
      coord_y = 0

      # When
      score = ScoreCalculation.get_area_score(coord_x, coord_y, n, grid)

      # Then
      expect(score).to be == 13
    end

    it 'should calculate area score for top-right cell' do
      # Given
      grid = [5, 3, 1, 4, 1, 1, 2, 3, 2]
      n = 3
      coord_x = 0
      coord_y = 2

      # When
      score = ScoreCalculation.get_area_score(coord_x, coord_y, n, grid)

      # Then
      expect(score).to be == 6
    end

    it 'should calculate area score for bottom-left cell' do
      # Given
      grid = [5, 3, 1, 4, 1, 1, 2, 3, 2]
      n = 3
      coord_x = 2
      coord_y = 0

      # When
      score = ScoreCalculation.get_area_score(coord_x, coord_y, n, grid)

      # Then
      expect(score).to be == 10
    end

    it 'should calculate area score for bottom-right cell' do
      # Given
      grid = [5, 3, 1, 4, 1, 1, 2, 3, 2]
      n = 3
      coord_x = 2
      coord_y = 2

      # When
      score = ScoreCalculation.get_area_score(coord_x, coord_y, n, grid)

      # Then
      expect(score).to be == 7
    end

    it 'should calculate area score for middle cell' do
      # Given
      grid = [5, 3, 1, 4, 1, 1, 2, 3, 2]
      n = 3
      coord_x = 1
      coord_y = 1

      # When
      score = ScoreCalculation.get_area_score(coord_x, coord_y, n, grid)

      # Then
      expect(score).to be == 22
    end
  end
end 
