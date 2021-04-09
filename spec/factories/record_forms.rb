FactoryBot.define do
  factory :record_form do
    post_cord     {'123-4567'}
    prefecture_id {2}
    city          {'東京都'}
    house_number  {'新宿区1-1'}
    building_name {'東京タワー'}
    phone_number  {'0123456789'}
  end
end
