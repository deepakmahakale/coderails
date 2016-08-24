Rails.application.routes.draw do
  scope :demo do
    resource :wicked_pdf, only: [], controller: :wicked_pdf do
      collection do
        get :table_with_no_break
      end
    end

    get 'wicked_pdf', to: 'wicked_pdf#index'

    resources :fusion_charts, only: [:index] do
      collection do
        get :column2d
      end
    end

    resource :jwplayer, only: [], controller: :jwplayer do
      collection do
        get :skin
      end
    end
    get 'jwplayer', to: 'jwplayer#index'
  end

  get :home, to: 'pages#home'
  get :demo, to: 'pages#demo'

  root to: 'pages#home'

  match '*path' => redirect('/'), via: :get

end
