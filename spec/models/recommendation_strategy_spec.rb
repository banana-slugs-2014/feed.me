require 'spec_helper'

describe RecommendationStrategy do

  context 'associations' do
    it {should have_many :recommendations}
  end

end