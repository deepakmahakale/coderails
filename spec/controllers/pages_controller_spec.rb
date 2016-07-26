RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    it 'returns http success' do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #demo' do
    it 'returns http success' do
      get :demo
      expect(response).to have_http_status(:success)
    end
  end
end
