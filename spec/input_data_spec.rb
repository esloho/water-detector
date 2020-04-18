require_relative '../lib/input_data'

describe InputData do

  describe '#validate' do

    it 'should raise exception if t not provided' do
      # Given
      t = nil
      n = 2
      grid = [1, 2, 3, 4]

      # Then
      expect { InputData.validate(t, n, grid) }.to raise_error(message='Error: insufficient number of arguments')
    end

    it 'should raise exception if n not provided' do
      # Given
      t = 1
      n = nil
      grid = [1, 2, 3, 4]

      # Then
      expect { InputData.validate(t, n, grid) }.to raise_error(message='Error: insufficient number of arguments')
    end

    it 'should raise exception if n does not correspond to size of grid' do
      # Given
      t = 1
      n = 2
      grid = [1, 2, 3, 4, 5]

      # Then
      expect { InputData.validate(t, n, grid) }.to raise_error(message='Error: The n is inconsistent with the length of the given grid')
    end
  end
end
