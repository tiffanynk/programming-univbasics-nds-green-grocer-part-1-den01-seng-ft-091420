require 'pry'

def find_item_by_name_in_collection(name, collection)
  collection.find {|piece| piece[:item] == name }
end

def consolidate_cart(cart)
#receipt represents accumlator value. set to an empty array
  cart.reduce([]) do |receipt, piece| 
    item_in_receipt = find_item_by_name_in_collection(piece[:item], receipt)

    if item_in_receipt
      item_index = receipt.find_index item_in_receipt
      item_in_receipt[:count] += 1
      receipt[item_index] = item_in_receipt
      receipt
    else
      #if item_in_rceipt is nil, item is not in receipt
      piece[:count] = 1
      receipt << piece
    end
  end
end


  