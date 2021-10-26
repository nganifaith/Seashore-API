require 'rails_helper'

RSpec.describe FavoritesController, type: :routing do
  describe 'routing' do
    it 'routes to #create_favorite' do
      expect(POST: 'favorites#create').to route_to('favorites#create')
    end
  end
end
