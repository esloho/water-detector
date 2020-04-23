# Water Detector

This program processes the input data to find concentrated areas of water presence. The analysis consists of generating a score for each location on the grid to find and show the t highest rated locations and their respective scores. 

## Installation

**Requirements:**
- Ruby 2.7
- Bundler 1.17.4 (the old version is due to compatibility issues with padrino) 
- padrino 0.14.4 (only for web app usage)

If you do not have ruby installed in your machine you might want to check first the [ruby installation instructions](https://www.ruby-lang.org/en/documentation/installation/). Once you have ruby installed you can install the rest of requirements with:

    $ gem install bundler -v 1.17.3
    $ gem install padrino

In order to install the water-detector program you need to run the following command from within the `water-detector` folder:

    $ bundler _1.17.4_ install --path=vendor/bundle

## Usage

### As command line program

To execute the program from the command line you must run:

    $ ruby water_detector.rb [t] [n] [grid]
    
where:
- t is the number of results requested
- n is the size of the grid
- grid is a space delimited list of numbers that form the grid, starting with row 0

### As web app

To run as web app you need to have installed [padrino](http://padrinorb.com/) (see requirements), a lightweight alternative to Rails. 

Once installed, you need to start the server from the project folder with:

    $ padrino start

You can then access the web app at http://localhost:3000


## Test

All tests can be executed at once by running from within the project folder:

    $ rspec
