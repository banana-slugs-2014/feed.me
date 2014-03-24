require 'spec_helper'

describe UserLike do
  context "mass assignment (attr_accessible)" do
    it {should allow_mass_assignment_of :name}
    it {should allow_mass_assignment_of :category}
  end

  context 'associations' do
    it {should belong_to(:user).with_foreign_key 'uid'}
  end
end