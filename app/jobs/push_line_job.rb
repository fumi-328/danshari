class PushLineJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      # 今日がdeadlineのPostレコードを取得
      posts_today = Post.where(deadline: Date.today)
      posts_today.each do |post|
        if post.user.line_alert == true
          message = {
            type: 'text',
            text: "#{post.name}の期限が今日です。断捨離を行いましたか？"
          }
          response = line_client.push_message(post.user.uid, message)
          logger.info "PushLineSuccess"
        end
      end
    end
  
    private
  
    def line_client
      Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }
    end
  end