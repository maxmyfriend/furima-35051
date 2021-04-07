FactoryBot.define do
  factory :product do
    name             {'商品名'}
    content          {'商品の説明'}
    category_id      {2}
    status_id        {2}
    delivery_fee_id  {2}
    prefecture_id    {2}
    arrival_date_id  {2}
    price            {500}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
