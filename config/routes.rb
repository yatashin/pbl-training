Rails.application.routes.draw do
  # ルートパスをメッセージ一覧に設定
  root "messages#index"

  # RESTfulなルーティングを採用
  resources :messages, only: [:index, :new, :create]

  # アプリのヘルスチェック用ルーティング（変更不要）
  get "up" => "rails/health#show", as: :rails_health_check
end
