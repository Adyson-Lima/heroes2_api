require 'rails_helper'

RSpec.describe Api::V1::HeroesController, type: :controller do
  
  before{@hero = Hero.create(name: 'cyclops', description: 'olhar profundo')}

  describe 'GET /api/v1/heroes' do
    it 'Consegue listar todos os heroes e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end
  
end