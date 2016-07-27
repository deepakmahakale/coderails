RSpec.describe Demo::FusionChartsController, type: :controller do
  describe 'GET #column2d' do
    it 'returns http success' do
      get :column2d
      expect(response).to have_http_status(:success)
    end
  end
end
