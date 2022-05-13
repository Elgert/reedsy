class Item < ApplicationRecord
  validates :code, presence: true
  validates :name, presence: true
  validates :price, presence: true

  def self.get_list_price(list)
    items = all.index_by(&:code)
    total_amount = 0

    list.each do |item|
      price = items[item[:code]].price
      total_amount += price * item[:amount]
    end

    total_amount
  end
end
