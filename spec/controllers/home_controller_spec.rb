require 'rails_helper'

describe HomeController do
  describe 'index' do
    it 'returns success status' do
      get :index
      expect(response.status).to eq 200
    end
  end
end
