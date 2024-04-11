FactoryBot.define do
    factory :user do
      sequence(:name) { |n| "ユーザー#{n}" }
      email { "test@example.com" }
      password { 'password' }
      password_confirmation { 'password' }
      line_alert { true }
      provider { "line" }
      sequence(:uid) { |n| "123456789#{n}" }
    end
end