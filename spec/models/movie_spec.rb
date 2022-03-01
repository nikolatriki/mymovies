require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject(:movie) { create(:movie, genre: genre) }

  let(:movie) { create(:movie, genre: genre) }
  let(:genre) { create(:genre) }

  describe 'associations' do
    it { expect(movie).to belong_to(:genre) }
  end

end