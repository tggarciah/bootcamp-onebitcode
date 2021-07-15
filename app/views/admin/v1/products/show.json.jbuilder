# json.product do
#   json.partial! @product
#   json.partial! @product.productable
# end
json.product do
  json.partial! @product
  json.partial! @product.productable
end