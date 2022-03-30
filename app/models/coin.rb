class Coin < ApplicationRecord
# Zadanie 1: Minimalna liczba monet

  PL_COINS = [0.01, 0.02, 0.05, 0.1, 0.2, 0.5, 1, 2, 5];

  def coins(amount, coins = PL_COINS)
    result = {}
    rest = amount
    coins_sorted_by_largest = coins.sort{|x, y| y <=> x}

    coins_sorted_by_largest.each do |coin|
      if rest.round(2) >= coin
        count_of_coins = (rest.round(2) / coin).to_i
        rest -= count_of_coins * coin
      else
        next
      end

      result[coin] = count_of_coins

      break if rest == 0
    end

    result
  end
end
