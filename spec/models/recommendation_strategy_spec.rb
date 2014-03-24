require 'spec_helper'

describe RecommendationStrategy do

  context 'associations' do
    it {should have_many :recommendations}
  end

  context '#recommend' do
    it "should raise a runtime error" do
      expect{RecommendationStrategy.new.recommend("test")}.to raise_error(RuntimeError)
    end
  end
end