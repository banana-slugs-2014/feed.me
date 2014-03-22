class Recommendation < ActiveRecord::Base

  belongs_to :user
  belongs_to :place

  attr_reader :strategy, :user
  attr_accessor :recommendable

  def initialize(args)
    @strategy = args[:strategy]
    @user = args[:user]
    @recommendable = args.fetch(:recommendable, Place)
  end

  def recommend
    strategy.recommend(self)
  end

end