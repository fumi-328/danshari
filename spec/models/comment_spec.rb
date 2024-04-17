require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションチェック' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }

    it 'body、user_id、post_idがあれば有効である' do
      comment = build(:comment, body: 'テストコメント', user: user, post: post)
      expect(comment).to be_valid
    end

    it 'bodyがなければ無効である' do
      comment = build(:comment, body: nil, user: user, post: post)
      expect(comment).not_to be_valid
    end

    it 'bodyが65,535文字を超える場合は無効である' do
      long_body = 'a' * 65_536
      comment = build(:comment, body: long_body, user: user, post: post)
      expect(comment).not_to be_valid
    end

  end
end