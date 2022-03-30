class Course < ApplicationRecord
# Zadanie 3: Funkcja licząca kurs całkowity

  def calculate_total_odds(bets, system_type = nil)
    coupons = []
    result = 0
    copied_bets = bets.dup

    if system_type.present?
      bets.each do |bet|
        copied_bets.delete_at(0)

        copied_bets.each do |temp_bet|
          coupons << (bet[:odds] * temp_bet[:odds]).round(3)
        end
      end
      result = (coupons.sum / coupons.length).round(3)
    else
      result = bets.map{|x| x[:odds]}.inject(:*).round(3)
    end
  end
end
