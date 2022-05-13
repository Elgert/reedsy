class ItemService
  def self.get_list_price(list)
    items = Item.all.index_by(&:code)
    total_price = 0

    list.each do |item|
      price = items[item[:code]].price
      item_price = price * item[:amount]
      discount_amount = 0

      case item[:code]
      when 'TSHIRT'
        discount_amount = DiscountService.get_tshirt_discount(item[:amount], item_price)
      when 'MUG'
        discount_amount = DiscountService.get_mug_discount(item[:amount], item_price)
      end

      total_price += item_price - discount_amount
    end

    total_price
  end
end
