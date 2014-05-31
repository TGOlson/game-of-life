# Game of Life

It's the [Conway's Game of Life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life) you know and love.

Implemented in both Ruby and JS.

## Ruby

Built with OO design principles. Relies on ```Game```, ```Board```, and ```Cell``` classes.

Still in need of more testing and optimization.

Runs via the command line with the following args:

```
$ ruby game.rb [cols] [rows] [factor] [speed]
```

* ```cols``` is the number of columns, or x value for the grid. This defaults to 10.
* ```rows``` is the number of rows, or y value for the grid. This defaults to 10.
* ```factor``` is the chance a cell will be alive when the board is initially seeded. This defaults to 0.8 if no value is specified. Values lower than 0.6 tend to weed out quickly, and values higher than 0.9 tend to stall out quickly.
* ```speed``` is the refresh rate on the display in seconds.

## JS

Still todo.
