
Tax=0.05

def calculate_total (order)
begin

rescue NameError => ex
  puts "oops, there was a #{ex.class} exception"
end
  total = 0

  for item in order
    quantity = item[:quantity]
    price = item[:price]
    total = total + (quantity * price)
  end

  cost = total * (1 + Tax)
  text = "$%.2f" % cost

  "Total will be " + text
end

puts calculate_total [{:quantity=>2 , :price=>2 }, {:quantity => 3,:price => 0.89}]
# puts calculate_total
