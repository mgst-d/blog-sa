FactoryBot.define do
  factory :post do
    title { "MyString" }
    description { "MyText" }
    body { "MyText" }
    user { nil }
  end
end
