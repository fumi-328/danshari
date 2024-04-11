require 'rails_helper'

RSpec.describe Praise, type: :model do

  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      praise = build(:praise)
      expect(praise).to be_valid
    end
  end

  context 'ユーザーと掲示板の組み合わせがユニークでない場合' do
    it '無効であること' do
      praise = create(:praise)
      new_praise = build(:praise, user: praise.user, post: praise.post)
      new_praise.valid?
      expect(new_praise.errors[:user_id]).to include('はすでに存在します'), 'praiseとuserのユニークバリデーションが設定されていません'
    end
  end
end