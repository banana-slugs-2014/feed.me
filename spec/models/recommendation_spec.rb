require 'spec_helper'

describe Recommendation do

  context 'associations' do
    it {should belong_to :user}
    it {should belong_to :place}
    it {should belong_to :strategy}
  end

  context 'assignment' do
    it {should allow_mass_assignment_of :place}
    it {should allow_mass_assignment_of :user}
    it {should allow_mass_assignment_of :strategy}
  end

  context 'validations' do
    it {should validate_presence_of :user}
    it {should validate_presence_of :place}
    it {should validate_presence_of :strategy}
  end

end