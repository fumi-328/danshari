class LineBotController < ApplicationController
    protect_from_forgery with: :null_session
  
    def callback
      # LINE Messaging APIからのリクエスト処理
        head :ok
    end
end
  