require 'rails_helper'

RSpec.describe FavoritesController, type: :routing do
  describe 'routing' do
    it 'routes to #set_favorite' do
      expect(PUT: 'favorites/set').to route_to('favorites#set_favorite')
    end
    it 'routes to #destroy_favorite' do
      expect(DELETE: 'favorites/delete').to route_to('favorites#destroy_favorite')
    end
  end
end
