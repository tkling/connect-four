#! /usr/bin/env ruby

@game_board = (0..6).map { Array.new }

def show_game
  puts((0..5).reverse_each.map do |row_index|
    @game_board.map do |column|
      column[row_index]
    end.to_s
  end.join("\n"))
end

def find_a_winner
  vertical_winner || horizontal_winner || diagonal_winner
end

def vertical_winner
  @game_board.each do |column|
    last_read = nil
    count = 0

    column.each do |item|
      next if item.nil?
      return item if count == 3 && last_read == item

      if last_read == item
        count += 1
      else
        last_read = item
        count = 1
      end
    end
  end
  false
end

def horizontal_winner
  # iterate across columns
  # return true if there are 4 of the same in a row
  false
end

def diagonal_winner
  # this one is tough to think about LOL
  false
end

def prompt(player_symbol)
  puts "Player '#{ player_symbol }', type the column you'd like to play followed by [enter]: 1 - 7"
  input = gets.chomp
  @game_board[input.to_i - 1].push player_symbol
end

def show_winner(winner)
  show_game
  puts "Player #{ winner } won the game!\nPress [enter] to exit"
  while input = gets.chomp
    exit false if input.empty?
  end
end

player = 'x'
winner = false

until winner
  show_game
  prompt player
  player = player == 'x' ? 'o' : 'x'
  winner = find_a_winner
end

show_winner(winner)
