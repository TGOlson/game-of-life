# Game of Life

It's the [Conway's Game of Life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life) you know and love.

Implemented in both Ruby and JS.

## Ruby

Built with OO design principles. Relies on ```Game```, ```Board```, and ```Cell``` classes.

Still in need of more testing and optimization.

Runs via the command line.

```
$ ruby ruby/game.rb
```

Accepts the following named args:

* ```--cols``` is the number of columns, or x value for the grid. Defaults to 20.
* ```--rows``` is the number of rows, or y value for the grid. Defaults to 20.
* ```--factor``` is the chance a cell will be alive when the board is initially seeded. Defaults to 0.2 if no value is specified. Values higher than 0.5 tend to weed out quickly, and values higher than 0.1 tend to stall out quickly.
* ```--speed``` is the refresh rate on the display in seconds. Defaults to 0.3 seconds.

## JS

Still todo.
