require 'spec_helper'
require 'rails_helper'

RSpec.describe "Groups", type: :request do
  before(:example) do
    @user = User.create(name: "User 1", email: "test@gamil.com", password: 'password')
    sign_in @user
    @group = Group.create(name: "Group 1", icon: "icon1")
  end

describe 'GET /groups' do
    it "Log's in user" do
      get '/groups'
      expect(response).to have_http_status(200)
    end

    it 'Get /groups url template' do
      get '/groups'
      expect(response).to have_http_status(200)
    end

    it 'render index template)' do
      get '/groups'
      expect(response).to render_template(:index)
    end

    it 'render correct response body)' do
      get '/groups'
      expect(response.body).to include('Add category')
    end
  end

  describe 'GET /groups/:id' do
    it 'Get /groups/:id url template' do
      get "/groups/#{@group.id}"
      expect(response).to have_http_status(200)
    end

    it 'render show template)' do
      get "/groups/#{@group.id}"
      expect(response).to render_template(:show)
    end

    it 'render correct response body)' do
      get "/groups/#{@group.id}"
      expect(response.body).to include('Group 1')
    end
  end

  describe 'GET /groups/new' do
    it 'Get /groups/new url template' do
      get '/groups/new'
      expect(response).to have_http_status(200)
    end

    it 'render new template)' do
      get '/groups/new'
      expect(response).to render_template(:new)
    end

    it 'render correct response body)' do
      get '/groups/new'
      expect(response.body).to include('Add category')
    end
  end

  describe 'POST /groups' do
    it 'Post /groups url template' do
      post '/groups', params: { group: { name: 'Group 2', icon: 'icon2' } }
      expect(response).to have_http_status(302)
    end

    it 'redirect to index template)' do
      post '/groups', params: { group: { name: 'Group 2', icon: 'icon2' } }
      expect(response).to redirect_to('/groups')
    end
  end

  describe 'GET /groups/:id/edit' do
    it 'Get /groups/:id/edit url template' do
      get "/groups/#{Group.last.id}/edit"
      expect(response).to have_http_status(200)
    end

    it 'render edit template)' do
      get "/groups/#{Group.last.id}/edit"
      expect(response).to render_template(:edit)
    end

    it 'render correct response body)' do
      get "/groups/#{Group.last.id}/edit"
      expect(response.body).to include('Edit category')
    end
  end
end
