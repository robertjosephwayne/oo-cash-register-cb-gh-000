class CashRegister
  attr_reader :discount, :items
  attr_accessor :total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @last_transaction = { total: 0, items: [] }

    quantity.times do
      @total += price
      @items << title

      @last_transaction[:total] += price
      @last_transaction[:items] << title
    end
  end

  def apply_discount
    @total -= @total * @discount / 100
    if discount > 0
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction[:total]
  end
end
