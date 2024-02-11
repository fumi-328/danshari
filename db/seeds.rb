# frozen_string_literal: true
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do
    User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Devise.friendly_token[0, 20],
        created_at: Time.now,
        updated_at: Time.now,
        provider: "line",
        uid: SecureRandom.uuid
      )
    end
  
  User.all.each do |user|
    5.times do
      Post.create!(
        title: Faker::Lorem.sentence(word_count: 3),
        body: Faker::Lorem.paragraph(sentence_count: 2),
        user_id: user.id,
        discard_flag: [true, false].sample,
        deadline: Faker::Date.forward(days: 23)
      )
    end
end
