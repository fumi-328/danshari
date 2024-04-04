FactoryBot.define do
    factory :post do
      sequence(:title) { |n| "タイトル#{n}" }
      sequence(:body) { |n| "本文#{n}" }
      association :user # 関連するuserを生成
      discard_flag { false }
      deadline { 1.week.from_now }
      post_image { nil } 
    end
end