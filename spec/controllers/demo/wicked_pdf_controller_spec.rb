RSpec.describe Demo::WickedPdfController, type: :controller do
  describe 'GET #table_with_no_break' do
    it 'returns http success' do
      get :table_with_no_break
      expect(response).to have_http_status(:success)
    end
  end
end
