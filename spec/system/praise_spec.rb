require 'rails_helper'

RSpec.describe 'えらいボタン', type: :system do
  let(:user) { create(:user) }
  let!(:post) { create(:post) }
  let!(:praise) { create(:praise, user: user) }

  it 'えらいができること' do
    login_as(user)
    visit '/posts'
    find("#praise-button-for-post-#{post.id}").click
    expect(current_path).to eq('/posts'), 'えらい後に、一覧画面が表示されていません'
    expect(page).to have_css("#unpraise-button-for-post-#{post.id}"), "idがunpraise-button-for-post-#{post.id}のリンクが表示されていません"
  end

  it 'えらいを外せること' do
    login_as(user)
    visit '/posts'
    # えらいを外す
    find("#unpraise-button-for-post-#{praise.post.id}").click
    expect(current_path).to eq('/posts'), 'えらい解除後に、一覧画面が表示されていません'
    expect(page).to have_css("#praise-button-for-post-#{post.id}"), "idがpraise-button-for-post-#{post.id}のリンクが表示されていません"
  end
end