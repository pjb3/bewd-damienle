class Product
  attr_accessor :name, :price, :myarray

  def initialize(attrs={})
    @myarray||=[]
    attrs.each do |attr, value|
      send("#{attr}=", value)
    end
  end

  def add(product)
    @myarray << product

  end
  def find(fname)
    if product=myarray.find{|prod| prod.name==fname}
        puts "Found it"
        product
      else
        puts "not found"
    end

  end
end

class Lineitem
   attr_accessor :myproduct, :quantity, :liprice

   def initialize(quan,name)
      myproduct=find(name)
      quantity=quan
   end
   def calculate
      liprice=quantity*myproduct.price

   end


end

class Order
  tax=0
  total=0
  def initialize (taxcode: 0)
    arrayitem ||= []
    tax = taxcode
  end

  def caltotal
    total=arrayitem.reduce(0){|sum, e| sum + e.liprice }
    total=total*(1+tax)
    "Total will be " + "$%.2f" % total
  end
  def addon(name)
    myproduct=find(name)
    item=Lineitem.new
    arrayitem << item

  end

end

item=Product.new(name: "iphone", price: "120")
item.add Product.new(name: "iphone2", price: "220")
item.myarray.each{|n| puts n.name; puts n.price }
item.find("iphone2")