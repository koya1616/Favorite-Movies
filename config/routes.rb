Rails.application.routes.draw do
  
  get 'inquiry/index'    => 'inquiry#index'     # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面
  devise_for :users
  root to: 'homes#top' #URLがルートだった場合topへ
  get "/home/about" => "homes#about"
  
  resources :movies,only:[:create,:index,:show,:edit,:update,:destroy] do
    resource  :favorites     , only:[:create,:destroy]
    resources :movie_comments, only:[:create,:destroy]
  end
  
  resources :users,only:[:index,:show,:edit,:update]
  
  
  
end
