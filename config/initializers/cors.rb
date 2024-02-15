Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' # すべてのオリジンからのリクエストを許可する場合
  
      # 実際の設定はここに追加する
      # origins 'https://example.com' # 特定のオリジンからのリクエストを許可する場合
  
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
    end
end