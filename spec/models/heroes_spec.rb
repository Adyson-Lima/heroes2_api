require 'rails_helper'

RSpec.describe Hero, type: :model do

  before{@hero = Hero.new}

  describe 'Testes de preenchimento do model Hero' do

    it 'name consegue ser preenchido?' do
      @hero.name = 'spiderman'
      expect(@hero.name).to eq('spiderman')
    end    

    it 'description consegue ser preenchido?' do
      @hero.description = 'inimigo do venon'
      expect(@hero.description).to eq('inimigo do venon')
    end

  end

  describe 'Testes de validação do model Hero' do

    it 'hero valido com campos obrigatorios preenchidos?' do
      @hero.name = 'wolverine'
      @hero.description = 'muito brabo'
      expect(@hero).to be_valid
    end

  end

end