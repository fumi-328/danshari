require 'rails_helper'

RSpec.describe 'コメント', type: :system do
  let(:me) { create(:user) }
  let(:post) { create(:post) }
  let!(:comment_by_me) { create(:comment, user: me, post: post) }
  let!(:comment_by_others) { create(:comment, post: post) }

  describe 'コメントのCRUD' do
    before do
      login_as(me)
      visit posts_path
      within "#post-id-#{post.id}" do
        page.find_link(post.title, exact_text: true).click
      end
    end

    describe 'コメントの一覧' do
      it 'コメントの一覧が表示されること' do
        expect(page).to have_content(comment_by_me.body), 'コメントの本文が表示されていません'
      end
    end

    describe 'コメントの作成' do
      it 'コメントを作成できること' do
        fill_in 'コメント', with: '新規コメント'
        find('input[type="submit"][value="投稿"]').click
        comment = Comment.find_by(body: '新規コメント')
				expect(page).to have_content('新規コメント'), '新規作成したコメントの本文が表示されていません'
      end

      it 'コメントの作成に失敗すること' do
      expect {
        fill_in 'コメント', with: ''
        find('input[type="submit"][value="投稿"]').click
        sleep(0.5)
      }.to change { Comment.count }.by(0), 'コメントが作成されています'
      end
    end

    describe 'コメントの削除' do
      it 'コメントを削除できること' do
        within("#comment-#{comment_by_me.id}") do
          page.accept_confirm { find('.delete-comment-link').click }
        end
        expect(page).not_to have_content(comment_by_me.body), 'コメントの削除が正しく機能していません'
      end
    end

    describe 'コメントの編集' do
      context '他人のコメントの場合' do
        it '編集ボタン・削除ボタンが表示されないこと' do
          within "#comment-#{comment_by_others.id}" do
            expect(page).not_to have_selector('.delete-comment-button'), '他人のコメントに対して削除ボタンが表示されてしまっています'
          end
        end
      end
    end
  end
end