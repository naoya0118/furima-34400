FactoryBot.define do
  factory :item do
    title              {"えんとつ町のプペル"}
    explanation        {"西野亮廣監督の感動の絵本"} 
    price              {12345} 
    category_id        {3}
    state_id           {3}
    delivery_fee_id    {2}
    delivery_area_id   {2}
    delivery_date_id   {2}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
