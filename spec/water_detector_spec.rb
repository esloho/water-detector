require_relative '../water_detector'

describe 'WaterDetector' do

  describe '#main' do

    it 'should exit the program and print a message if no results are requested' do
      # Given
      t = 0
      n = 4
      grid = [5, 3, 1, 2, 4, 1, 1, 3, 2, 3, 2, 4, 0, 2, 3, 3]

      # Then
      expect { main(t, n, grid) }.to output("No results requested\n").to_stdout
    end

    it 'should print messages for the requested results' do
      # Given
      t = 2
      n = 4
      grid = [5, 3, 1, 2, 4, 1, 1, 6, 2, 3, 2, 4, 0, 2, 3, 3]

      # Then
      expect { main(t, n, grid) }.to output("(2, 2, score: 25)\n(2, 1, score: 23)\n").to_stdout
    end
  end
end 
