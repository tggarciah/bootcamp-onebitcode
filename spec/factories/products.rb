FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Basic #{n}" }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 100.0..400.00) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/product_image.png')) }


    # sintaxe para criar um game ao criar um produto
    after :build do | product |
      product.productable = create(:game)
    end
  end
end
