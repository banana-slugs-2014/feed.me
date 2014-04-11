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

  context '.strategies' do
    it 'should return an array' do
      expect(RecommendationStrategy.strategies).to be_an_instance_of Array
    end
  end

  context '.inherited' do
    it 'should change array count with new subclass' do
      expect{
        class TestStrategy < RecommendationStrategy; end
      }.to change{ RecommendationStrategy.strategies.length }.by(1)
    end
  end
end