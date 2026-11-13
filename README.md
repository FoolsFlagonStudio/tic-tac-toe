# Tic Tac Toe

A command line Tic Tac Toe game for two players. Each player enters a name and picks their own symbol, then they take turns choosing a numbered spot on the board. The board is shown between turns, and the game ends when someone gets three in a row (horizontally, vertically or diagonally) or the board fills up in a tie.

Built as part of [The Odin Project](https://www.theodinproject.com/) Ruby curriculum.

## Assignment

[Tic Tac Toe - The Odin Project](https://www.theodinproject.com/lessons/ruby-tic-tac-toe)

## Usage

```bash
ruby main.rb
```

Example:

```
Enter Player 1's Name: Evan
Enter Player 1's Symbol: X
Enter Player 2's Name: Sam
Enter Player 2's Symbol: O
Evan pick a number:
1 2 3
4 5 6
7 8 9
```

Invalid moves (out of range, blank or already taken) show an error message instead of crashing the game.

## Project Structure

```
tic-tac-toe/
├── main.rb        # Collects player info and starts the game
└── lib/
    ├── game.rb    # Runs the game loop, tracks turns and handles input
    ├── board.rb   # Owns the grid, places markers and checks for wins and ties
    └── player.rb  # Holds a player's name and symbol
```

## What I Learned

- Planning classes before coding: deciding what each class is responsible for and keeping information shared between them to a minimum
- Using Game as the go-between so Board and Player never need to know about each other
- Structuring a Ruby project with an entry point in `main.rb` and classes in `lib/`, loaded with `require_relative`
- The difference between `require` and `require_relative`
- The difference between instance variables (`@`) and class variables (`@@`), and why `attr_reader` only works with instance variables
- The difference between instance methods and class methods, and why calling an instance method on the class itself raises a `NoMethodError`
- Building a 3x3 board with nested `Array.new` blocks and converting a 1-9 position into a row and column using division and remainder
- Checking for a win on any board size by checking rows, columns with `transpose`, and both diagonals with `all?` and `any?`
- Raising errors where a problem is found (Board and Player) and rescuing them where the user is handled (Game) with `begin`/`rescue`
- Ruby naming conventions like ending true/false methods with `?`

## Built With

- Ruby
