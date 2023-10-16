# Interactor shares an idea about the best way to interacting with multiple classes inorder to build a large functionality by combining them.

class ManageProducts
  include Interactor

  def call
    # manage products and their details
  end
end

class AddProduct
  include Interactor

  def call
    # Add product to purchase
  end
end

class OrderProduct
  include Interactor

  def call
    # Order product to purchase
  end
end

class DispatchProduct
  include Interactor

  def call
    # dispatch of the product here
  end
end

class ScheduleMailToNotify
  include Interactor

  def call
    # send an email to the respective buyer
  end
end

class PurchaseProduct
  include Interactor::Organizer

  organize ManageProducts, AddProduct, OrderProduct, DispatchProduct, ScheduleMailToNotify
end

result = PurchaseProdcut.call(
  recipient: buyer, product: product
)

puts outcome.success?
puts outcome.message
