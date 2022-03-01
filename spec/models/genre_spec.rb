require 'rails_helper'

RSpec.describe Genre, type: :model do
  subject(:genre) { create(:genre) }

  describe 'associations' do
    it { expect(genre).to have_many(:movies) }
  end

end
