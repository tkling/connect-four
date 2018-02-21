#! /usr/bin/env ruby

@game_board = (1..7).map { Array.new }

def show_game
  (0..5).reverse_each.map do |row_index|
    @game_board.map do |column|
      column[row_index]
    end
  end
end

def someone_has_won?
  vertical_win? || horizontal_win? || diagonal_win?
end

def vertical_win?
  # iterate through columns one by one
  # return true if there 4 of the same in a row
end

def horizontal_win?
  # iterate across columns
  # return true if there are 4 of the same in a row
end

def diagonal_win?
  # this one is tough to think about LOL
end

def prompt(player_symbol)

end

def show_winner
  puts 'Someone won the game!'
  puts 'Press [enter] to exit'
  while input = gets.chomp
    exit false if input.empty?
  end
end

until someone_has_won?
  show_game
  prompt 'x'
  show_game
  prompt 'o'
end

show_winner
