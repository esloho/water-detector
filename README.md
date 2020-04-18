# Water Detector

This program processes the input data to find concentrated areas of water presence. The analysis consists of generating a score for each location on the grid to find and show the t highest rated locations and their respective scores. 

## Installation

This is a ruby program. If you do not have ruby installed in your machine you might want to check first the [ruby installation instructions](https://www.ruby-lang.org/en/documentation/installation/).

In order to install the water-detector simply run the following command from within the `water-detector` folder:

    $ bundle install

## Usage

To execute the program you must run:

    $ ruby water_detector.rb [t] [n] [grid]
    
where:
- t is the number of results requested
- n is the size of the grid
- grid is a space delimited list of numbers that form the grid, starting with row 0

## Test

All tests can be executed at once by running:

    $ rspec
