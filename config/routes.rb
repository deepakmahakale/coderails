Rails.application.routes.draw do
  namespace :demo, only: [] do
    resource :wicked_pdf, controller: :wicked_pdf do
      collection do
        get :table_with_no_break
      end
    end
  end

  resource :pages, only: [] do
    get :home
    get :demo
  end

  root to: 'pages#demo'

  match '*path' => redirect('/'), via: :get
end
