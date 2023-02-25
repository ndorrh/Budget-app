require 'spec_helper'
require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /homes' do
    it " get '/' " do
      get '/'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/'
      expect(response).to render_template('index')
    end

    it 'displays the correct content' do
      get '/'
      expect(response.body).to include('SPENDWISELY')
    end
  end
end
