require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :quantity, :last_transaction_amount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @title = title
        @price = price
        @quantity = quantity
        if quantity > 0
            self.total += price * quantity 
            quantity.times do
            @items << @title
            end
        else
            self.total += price
            @items << @title
        end
        @last_transaction_amount = @price * @quantity
        @total
    end

    def apply_discount
        if @discount != 0
            self.total = (@total *((100-@discount.to_f)/100)).to_i
            return "After the discount, the total comes to $#{@total}."
        else   
            return "There is no discount to apply." 
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last_transaction_amount
    end
   
end