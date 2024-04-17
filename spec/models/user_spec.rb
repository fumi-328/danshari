require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションチェック' do
    it 'nameがない場合は無効である' do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
    end

    it 'nameが重複する場合は無効である' do
      create(:user, name: 'ユニークな名前')
      user_with_duplicate_name = build(:user, name: 'ユニークな名前')
      expect(user_with_duplicate_name).not_to be_valid
    end

    it '有効なユーザーは保存できる' do
      valid_user = build(:user)
      expect(valid_user).to be_valid
    end
  end
end