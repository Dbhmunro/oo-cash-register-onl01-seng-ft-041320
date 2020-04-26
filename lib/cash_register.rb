require "pry"

class CashRegister
    attr_accessor :total, :discount
    attr_reader :items 

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = Array.new
        # @transactions = {} #would be the ideal register
        @last_transaction_value = 0
    end

    def add_item(name, price, quantity = 1)
        @total = @total + (price * quantity)
        quantity.times do
            @items << name
        end
        @last_transaction_value = (price * quantity)
        # @transactions[name] = (price * quantity)
    end

    def apply_discount
        if (@discount > 0)
            # binding.pry
            @total = (@total * (1.00-(@discount/100.00)))
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end     

    def void_last_transaction
        @total = @total - @last_transaction_value
    end
end

# binding.pry
# 0