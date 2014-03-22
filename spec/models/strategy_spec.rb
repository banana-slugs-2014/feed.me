require 'spec_helper'

describe Strategy do

  context 'associations' do
    it {should have_many :recommendations}
  end

end