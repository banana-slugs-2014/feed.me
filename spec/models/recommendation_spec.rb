require 'spec_helper'

describe Recommendation do
  let(:recommendation) { create(:recommendation) }
  context 'associations' do
    it {should belong_to :user}
    it {should belong_to :place}
    it {should belong_to :recommendation_strategy}
  end

  context 'assignment' do
    it {should allow_mass_assignment_of :place}
    it {should allow_mass_assignment_of :user}
    it {should allow_mass_assignment_of :like}
    it {should allow_mass_assignment_of :recommendation_strategy}
  end

  context 'validations' do
    it {should validate_presence_of :user}
    it {should validate_presence_of :place}
    it {should validate_presence_of :recommendation_strategy}
  end

  context 'like_recommendation' do
    it 'should change like to true' do
      recommendation.like_recommendation
      expect(recommendation.like).to be_true
    end
  end

end