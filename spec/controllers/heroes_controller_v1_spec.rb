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

  describe 'GET /api/v1/heroes/id' do
    it 'Consegue listar um hero especifico e retornar status 200?' do
      get :show, params: {id: @hero.id}
      expect(response.body).to include_json(id: @hero.id)
      expect(response).to have_http_status(200)
    end    
  end

  describe 'POST /api/v1/heroes' do
    it 'Consegue criar um hero e retornar status 201?' do
      post :create, params: {hero: {name: 'vampira', description: 'parasita'}, format: :json}
      expect(response.body).to include_json(name: 'vampira')
      expect(response).to have_http_status(201)
    end
  end

  describe 'PATCH /api/v1/heroes/id' do
    it 'Consegue atualizar um hero e retornar status 200?' do
      hero = Hero.last
      patch :update, params: {hero: {name: 'xavier', description: 'mente poderosa'}, id: hero.id}
      expect(response.body).to include_json(name: 'xavier')
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /api/v1/heroes/id' do
    it 'Consegue excluir um hero e retornar status 204?' do
      hero = Hero.last
      delete :destroy, params: {id: hero.id}
      expect(Hero.all).not_to include(hero)
      expect(response).to have_http_status(204)
    end
  end
  
end