# Author: Murgray D. John
# Date created: 11/10/2022 
# Purpose: Takes in an array where each element represents a day's stock price, returns the best days to buy and sell.

def stock_picker(stocks)
    best_days = [0,0]
    last_index = stocks.length-1

    stocks.each_with_index do |buy_price, buy_day|
        last_index.downto(buy_day) do |sell_day|
            sell_price = stocks[sell_day]
            current_profit = sell_price - buy_price
            previous_profit = stocks[best_days[1]] - stocks[best_days[0]]
            
            if current_profit > previous_profit
                best_days[0] = buy_day
                best_days[1] = sell_day
            end
        end
    end
    best_days
end

def run_program
    stocks = [17,3,6,9,15,8,6,1,10]
    p stock_picker(stocks)
end

run_program