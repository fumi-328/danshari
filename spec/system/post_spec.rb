require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let(:user) { FactoryBot.create(:user, uid: '12345', password: 'password', password_confirmation: 'password') } # userを作成する際にuidを指定
  let!(:post) { create(:post, user: user) } # postを作成するときに、上で作成したuserを関連付ける

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:line] = OmniAuth::AuthHash.new(
      provider: 'line',
      uid: '12345', # userのuidと一致させる
      info: { email: user.email, name: user.name },
      credentials: { token: '1234qwer' }
    )
  end

  describe 'ログイン前' do
    describe 'ページ遷移確認' do
      context '投稿の新規作成ページにアクセス' do
        it '新規作成ページへのアクセスが失敗する' do
          visit new_post_path
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq root_path
        end
      end

      context '投稿の編集ページにアクセス' do
        it '編集ページへのアクセスが失敗する' do
          visit edit_post_path(post)
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq root_path
        end
      end
    end
  end


	describe 'ログイン後' do
    before { login_as(user) }

    	describe '新規投稿作成' do
      	#一回だとログインできないため
      	before { login_as(user) }
      	context 'フォームの入力値が正常' do
        	it '投稿の新規作成が成功する' do
          	visit new_post_path
          	click_on '投稿'
          	fill_in '名称', with: 'テスト投稿'
						fill_in 'なぜ捨てる？', with: '本文'
          	click_button '断捨離を始める'
          	expect(page).to have_current_path(posts_path)
        	end
      	end

    	end

    	describe '投稿編集' do
      	before { visit edit_post_path(post) }

      	context 'フォームの入力値が正常' do
        	it '投稿の編集が成功する' do
          	fill_in '名称', with: 'テスト投稿更新'
          	click_button '更新する'
          	expect(page).to have_content '断捨離memoを更新しました'
          	expect(page).to have_current_path(posts_path)
        	end
      	end

      	context '他ユーザーの投稿編集ページにアクセス' do
        	let!(:other_user) { create(:user, email: "other_user@example.com") }
        	let!(:other_post) { create(:post, user: other_user)}

					it '他ユーザーの投稿編集ページにアクセスしようとすると、編集・削除ボタンが表示されないこと' do
						visit edit_post_path(other_post)
						expect(page).not_to have_selector("#button-edit-#{other_post.id}")
						expect(page).not_to have_selector("#button-delete-#{other_post.id}")
					end
      	end
    	end


    	describe '投稿削除' do
      	let!(:post) { create(:post, user: user) }

				it 'アイテムの削除が成功する' do
					visit post_path(post)
					click_on "button-delete-#{post.id}"
					expect(page.accept_confirm).to eq '削除しますか？'
					expect(page).to have_content '断捨離memoを削除しました'
					expect(page).to have_current_path(posts_path)
				end
    	end
  	end
end