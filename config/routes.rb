Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :admin do
    resources :games, only:[:create, :index, :show, :edit, :update, :new, :destroy] do
      collection do
        get :edit_tag
        post :update_tag
      end
    end

    resources :admin_tags, only:[:create, :destroy]

    resources :reviews, only:[:index, :destroy]

    resources :users, only:[:index, :show, :edit, :update] do
      collection do
        get :reviews_index
        delete :review_destroy
      end
    end

  end

  resources :games do
    collection do
      post :rating_create
    end
  end
  resources :user, only:[:show, :edit] do
    collection do
      get :mypage
    end
  end
  resources :follows, only:[:create, :destroy]
  resources :user_tags, only:[:create, :destroy]

  resources :reviews, only:[:index, :create, :new] do
    collection do
      post :report
    end
  end

  resources :favorites, only:[:create, :destroy]

  resources :user_game_tags, only:[:new, :update]

  root to: 'homes#top'


end
