FactoryBot.define do
    factory :user do
      sequence(:name) { |n| "ユーザー#{n}" }
      email { "test@example.com" }
      line_alert { true }
      provider { "line" }
      uid { "1234567890" }
    end
end