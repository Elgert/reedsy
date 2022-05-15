# frozen_string_literal: true

items = [
  {
    code: 'MUG',
    name: 'Reedsy Mug',
    price: 6.00
  },
  {
    code: 'TSHIRT',
    name: ' Reedsy T-shirt',
    price: 15.00
  },
  {
    code: 'HOODIE',
    name: 'Reedsy Hoodie',
    price: 20.00
  }
]

items.each do |item|
  Item.find_or_create_by(item)
end
