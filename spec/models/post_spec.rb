require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションチェック' do
    #user作成
    before do
      @user = create(:user)
    end

    it '設定したすべてのバリデーションが機能しているか' do
      post = build(:post, user_id: @user.id)
      expect(post).to be_valid
    end
  end
end