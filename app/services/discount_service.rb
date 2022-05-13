class DiscountService
  TSHIRT_DISCOUNT = 0.3 # 30% reduce in price
  MUG_VOLUME_DISCOUNT = 0.02
  MAX_MUG_DISCOUNT = 0.3

  def self.get_tshirt_discount(amount, item_price)
    return 0 unless amount > 2

    item_price * TSHIRT_DISCOUNT
  end

  def self.get_mug_discount(amount, item_price)
    return 0 unless amount > 9

    mug_discount = (amount / 10) * MUG_VOLUME_DISCOUNT

    item_price * [mug_discount, MAX_MUG_DISCOUNT].min
  end
end
