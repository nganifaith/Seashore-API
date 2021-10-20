require 'rails_helper'

RSpec.describe Beach, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:details) }
  end

  describe 'associations' do
    it { should have_many(:favorite) }
    it { should have_many(:users) }
  end
end
