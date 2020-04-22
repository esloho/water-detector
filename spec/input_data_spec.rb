require_relative '../lib/input_data'

describe InputData do

  describe '#convert_to_aray' do

    it 'should convert space delimited string to array' do
      # Given
      input_grid = '1 2 3 4 5'

      # When
      grid = InputData.convert_to_array(input_grid)

      # Then
      expect(grid).to be == ["1", "2", "3", "4", "5"]
    end

    it 'should convert comma delimited string to array' do
      # Given
      input_grid = '1,2,3,4,5'

      # When
      grid = InputData.convert_to_array(input_grid)

      # Then
      expect(grid).to be == ["1", "2", "3", "4", "5"]
    end

    it 'should convert comma and space delimited string to array' do
      # Given
      input_grid = '1, 2, 3, 4, 5'

      # When
      grid = InputData.convert_to_array(input_grid)

      # Then
      expect(grid).to be == ["1", "2", "3", "4", "5"]
    end

    it 'should raise exception if string delimited with not allowed characters' do
      # Given
      input_grid = '1-2-3-4-5'

      # Then
      expect { InputData.convert_to_array(input_grid) }.to raise_error(message='Error: grid numbers can only be delimited by spaces or commas')
    end

  end

  describe '#validate' do

    it 'should raise exception if n does not correspond to size of grid' do
      # Given
      t = 1
      n = 2
      grid = [1, 2, 3, 4, 5]

      # Then
      expect { InputData.validate(t, n, grid) }.to raise_error(message='Error: The n is inconsistent with the length of the given grid')
    end
  end

  describe '#parse' do

    it 'should raise exception if t not provided' do
      # Given
      t = nil
      n = 2
      grid = [1, 2, 3, 4]

      # Then
      expect { InputData.parse(t, n, grid) }.to raise_error(message='Error: insufficient number of arguments')
    end

    it 'should raise exception if n not provided' do
      # Given
      t = 1
      n = nil
      grid = [1, 2, 3, 4]

      # Then
      expect { InputData.parse(t, n, grid) }.to raise_error(message='Error: insufficient number of arguments')
    end

    it 'should return input string parameters as numbers' do
      # Given
      input_t = '1'
      input_n = '2'
      input_grid = "1 2 3 4"

      # When
      t, n, grid = InputData.parse(input_t, input_n, input_grid)

      # Then
      expect(t).to be == 1
      expect(n).to be == 2
      expect(grid).to be == [1, 2, 3, 4]
    end

  end
end
