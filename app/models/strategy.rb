class Strategy < ActiveRecord::Base
  has_many :recommendations

  def recommend
    raise 'implement recommend method on subclassed strategy'
  end
end